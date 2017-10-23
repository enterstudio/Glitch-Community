# todo convert to async await fetch
# todo do accessibility w hidden tables

Observable = require 'o_0'
axios = require 'axios'
_ = require 'underscore'
moment = require 'moment'

AnalyticsTemplate = require "../templates/includes/analytics"
AnalyticsTimePopPresenter = require "./pop-overs/analytics-time-pop"
AnalyticsProjectsPopPresenter = require "./pop-overs/analytics-projects-pop"

METRICS = ["remixes", "visits"]
REFERRER_FIELDS = ["remixReferrers", "referrers"]
REFERRER_VALUES = ["remixes", "requests"]
COLORS = ["#70ECFF", "#F2A2FF"]
LINE_COLOR = "#c3c3c3"
BACKGROUND_COLOR = '#f5f5f5'
# HEIGHTS = [200, 200]

twoWeeks = moment().subtract(2, 'weeks').valueOf()
fourWeeks = moment().subtract(4, 'weeks').valueOf()
oneDay = moment().subtract(24, 'hours').valueOf()

# Crack open a promise so anyone can resolve or reject it later
OpenPromise = ->
  resolve = null
  reject = null
  p = new Promise (_resolve, _reject) ->
    resolve = _resolve
    reject = _reject

  p.resolve = resolve
  p.reject = reject

  return p

sum = (array) ->
  array.reduce (a, b) ->
    a + b
  , 0

module.exports = (application, teamOrProject) ->
  plotlyPromise = OpenPromise()

  self = 

    # analyticsTimeLabel: application.analyticsTimeLabel
    # analyticsProjectDomain: application.analyticsProjectDomain

    remixesChartElement: document.createElement 'div'
    remixesReferrersBars: document.createElement 'referrer-bars'

    visitsChartElement: document.createElement 'div'
    visitsReferrersBars: document.createElement 'referrer-bars'

    gettingAnalytics: Observable true
    gettingAnalyticsFromDate: Observable false
    gettingAnalyticsProjectDomain: Observable false
    # analyticsFromDate: Observable twoWeeks
    analyticsProjectDomain: Observable 'All Projects'
    analyticsTimeLabel: Observable 'Last 2 Weeks'
    
    analyticsFromDate: ->
      if self.analyticsTimeLabel() is 'Last 4 Weeks'
        fourWeeks
      else if self.analyticsTimeLabel() is 'Last 24 Hours'
        oneDay
      else
        twoWeeks
    
    # showRemixesReferrers: Observable false
    totalRemixes: Observable 0
    # showVisitsReferrers: Observable false
    totalVisits: Observable 0
    
    # PK: width of what text? is this a character spacing thing?
    # ET: this is the method we use to calculate the left margin of the two charts
    #     this way, the two charts have the same left margin
    # PK: that makes sense. I think it'd be clearer to future us if it was called something like
    # `getWidthOfYAxisLabel`. 'text' is too generic
    getWidthOfText: (txt, fontname, fontsize) ->
      f = self.getWidthOfText
      if f.c is undefined
        f.c = document.createElement 'canvas'
        f.ctx = f.c.getContext '2d'
      f.ctx.font = fontsize + ' ' + fontname
      return f.ctx.measureText(txt).width

    # PK: not sure what's a param here. is it a plotly specific thing?
    # ET: they are chart params: the left margin and the y-range
    calculateParams: (chartData) ->
      maxes = chartData.map (data) ->
        Math.max data.y...
      digits = maxes.map (max) ->
        Math.ceil Math.log10 max
      maxDigits = Math.max digits...
      if maxDigits <= 0
        maxDigits = 1
      # PK: what is 's'?
      # ET: It is just a temporary variable used to store the string with which
      #     we are going to calculate the width of the left margin
      # PK: is it used anywhere? I see it's definition, but no other references to it
      # ET: it is used 4 lines below...
      leftMarginString = [1..maxDigits].reduce (a, b) ->
        a + "9"
      , "9" # we add one digit because the histogram may aggregate buckets together
      leftMarginString = Plotly.d3.format(',dr')(parseInt leftMarginString)

      leftMargin: self.getWidthOfText leftMarginString, "Benton Sans", "14px" # super gross
      ranges: maxes.map (max) ->
        if max >= 3 then undefined else [0, 3]

    initCharts: ->
      console.log 'Plotly ready', Plotly

      elements = [
        self.remixesChartElement
        self.visitsChartElement
      ]
      elements.map (element, i) ->
        data =
          marker:
            color: COLORS[i]
          type: 'histogram'
          histfunc: "sum"
          nbinsx: 28

        layout =
          paper_bgcolor: BACKGROUND_COLOR
          plot_bgcolor: BACKGROUND_COLOR
          font:
            family: '"Benton Sans",Helvetica,Sans-serif'
          height: 200
          margin:
            l: 0
            r: 0
            b: 50
            t: 10
            pad: 0
          bargap: 0.2

        options =
          displayModeBar: false

        Plotly.newPlot element, [data], layout, options

    updateCharts: (analyticsData) ->
      chartData = self.mapChartData(analyticsData)

      self.updateTotals(chartData)

      {leftMargin, ranges} = calculatedParams = self.calculateParams(chartData)
      console.log 'calculateParams', calculatedParams

      elements = [
        self.remixesChartElement
        self.visitsChartElement
      ]

      chartData.map (data, i) ->

        layout =
          margin:
            l: leftMargin
            r: 0
            b: 50
            t: 10
            pad: 0
          xaxis:
            zeroline: false
            showline: true
            linecolor: LINE_COLOR
            type: "date"
            showgrid: true
            autorange: false
            fixedrange: true         
            #tickangle: 1e-10 # to have it aligned to the right of the tick          xaxis:
            range: [data.x[0].getTime() - 3600000, data.x[data.x.length-1].getTime() + 4 * 3600000]
          yaxis:
            fixedrange: true
            rangemode: "nonnegative"
            tickformat: ',dr'
            zeroline: false
            range: ranges[i]


        data.x = [data.x]
        data.y = [data.y]

        element = elements[i]
        Plotly.update element, data, layout

    drawCharts: (chartData) ->
      self.initCharts()
      self.updateCharts(chartData)

    updateTotals: ([remixData, visitsData]) ->
      formatter = Plotly.d3.format(',dr')
      self.totalRemixes formatter sum remixData.y
      self.totalVisits formatter sum visitsData.y
      
    initReferrers: ->
      elements = [
        self.remixesReferrersBars
        self.visitsReferrersBars
      ]

      elements.map (element, i) ->
        data =
          hoverinfo: 'none'
          marker:
            color: COLORS[i]
          type: 'bar'
          orientation: 'h'

        layout =
          paper_bgcolor: BACKGROUND_COLOR
          plot_bgcolor: BACKGROUND_COLOR
          font:
            family: '"Benton Sans",Helvetica,Sans-serif'
            size: 14
          margin:
            l: 0
            r: 10
            b: 10
            t: 10
            pad: 0
          barwidth: 20
          xaxis:
            showticklabels: false
            showgrid: false
            zeroline: false
            fixedrange: true
          yaxis:
            showticklabels: false
            fixedrange: true

        options =
          displayModeBar: false

        Plotly.newPlot element, [data], layout, options
        
    updateReferrers: (analyticsData) ->
      elements = [
        self.remixesReferrersBars
        self.visitsReferrersBars
      ]

      REFERRER_FIELDS.map (field, i) ->
        total = analyticsData[field].reduce (a, b) ->
          "#{REFERRER_VALUES[i]}": a[REFERRER_VALUES[i]] + b[REFERRER_VALUES[i]]
        , { "#{REFERRER_VALUES[i]}": 0 }
        total = total[REFERRER_VALUES[i]]

        referrers = analyticsData[field].filter (r, i) -> !r.self and i < 5
        # invert them
        referrers = referrers.reverse()
        referrers = referrers.map (r) ->
          domain: r.domain
          value: r[REFERRER_VALUES[i]]

        # NOTE: Plotly.restyle wants the arrays pushed down into the trace values YOLO!
        data =
          x: [referrers.map (r) -> r.value]
          y: [referrers.map (r) -> r.domain]
        
        layout =
          annotations: referrers.map (r) ->
            x: 0
            y: r.domain
            showarrow: false
            text: "#{r.value} - #{r.domain}"
            xanchor: "left"
            xshift: 5
          height: 20 + 30 * referrers.length

        element = elements[i]
        Plotly.update element, data, layout

    drawReferrers: (analyticsData) ->
      self.initReferrers()
      self.updateReferrers(analyticsData)
    
    mapChartData: (data) ->
      {buckets} = data

      METRICS.map (metric, i) ->
        x: buckets.map (x) -> new Date x.startTime
        y: buckets.map (y) -> y.analytics[metric] ? 0

    plotlyLoad: (e) ->
      console.log "Plotly Load", e
      self.initReferrers()
      self.initCharts()

      plotlyPromise.resolve()      

    getAnalyticsData: (fromDate, projectDomain) ->
      self.gettingAnalytics true
      id = teamOrProject.id()
      CancelToken = axios.CancelToken
      source = CancelToken.source()
      if projectDomain is 'All Projects'
        analyticsPath = "analytics/#{id}/team?from=#{fromDate}"
      else
        analyticsPath = "analytics/#{id}/project/#{projectDomain}?from=#{fromDate}"

      application.api(source).get analyticsPath
      .then ({data}) ->
        plotlyPromise.then ->
          self.gettingAnalytics false
          self.gettingAnalyticsFromDate false
          self.gettingAnalyticsProjectDomain false

          self.updateCharts(data)
          self.updateReferrers(data)

    toggleAnalyticsTimePop: (event) ->
      event.stopPropagation()
      element = event.currentTarget
      existingPop = element.querySelector(".analytics-time-pop")
      application.closeAllPopOvers()

      unless existingPop
        element.appendChild AnalyticsTimePopPresenter application, self

    toggleAnalyticsProjectsPop: (event) ->
      event.stopPropagation()
      element = event.currentTarget
      existingPop = element.querySelector(".analytics-projects-pop")
      application.closeAllPopOvers()

      unless existingPop
        element.appendChild AnalyticsProjectsPopPresenter application, self

    hiddenUnlessGettingAnalytics: ->
      'hidden' unless self.gettingAnalytics()

    hiddenUnlessGettingAnalyticsFromDate: ->
      'hidden' unless self.gettingAnalyticsFromDate()

    hiddenUnlessGettingAnalyticsProjectDomain: ->
      'hidden' unless self.gettingAnalyticsProjectDomain()

    currentUserIsOnTeam: ->
      application.team().currentUserIsOnTeam application

    hiddenUnlessCurrentUserIsOnTeam: ->
      'hidden' unless self.currentUserIsOnTeam application


  window.addEventListener 'resize', _.throttle ->
    Plotly.Plots.resize(self.remixesChartElement)
    Plotly.Plots.resize(self.remixesReferrersBars)
    Plotly.Plots.resize(self.visitsChartElement)
    Plotly.Plots.resize(self.visitsReferrersBars)
  , 50

  # Bind a function to rerun and fetch the analytics data when the dependent observables change
  Observable ->
    fromDate = self.analyticsFromDate()
    projectDomain = self.analyticsProjectDomain()

    self.getAnalyticsData(fromDate, projectDomain)

  return AnalyticsTemplate self
