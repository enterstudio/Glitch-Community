moment = require 'moment'

AnalyticsTimePopTemplate = require "../../templates/pop-overs/analytics-time-pop"

twoWeeks = moment().subtract(2, 'weeks').valueOf()
oneMonth = moment().subtract(4, 'weeks').valueOf()
oneDay = moment().subtract(24, 'hours').valueOf()

module.exports = (application, analytics) ->

  self =
  
    application: application
  
    # hiddenUnlessAnalyticsTimePopVisible: ->
    #   'hidden' unless application.analyticsTimePopVisible()

    stopPropagation: (event) ->
      event.stopPropagation()

    selectMonthFrame: ->
      analytics.analyticsTimeLabel 'Last 4 Weeks'
      # analytics.analyticsFromDate oneMonth
      analytics.gettingAnalyticsFromDate true

    selectWeeksFrame: ->
      analytics.analyticsTimeLabel 'Last 2 Weeks'
      # analytics.analyticsFromDate twoWeeks
      analytics.gettingAnalyticsFromDate true

    selectHoursFrame: ->
      analytics.analyticsTimeLabel 'Last 24 Hours'
      # analytics.analyticsFromDate oneDay
      analytics.gettingAnalyticsFromDate true

    activeIfLabelIsMonths: ->
      'active' if analytics.analyticsTimeLabel() is 'Last 4 Weeks'

    activeIfLabelIsWeeks: ->
      'active' if analytics.analyticsTimeLabel() is 'Last 2 Weeks'

    activeIfLabelIsHours: ->
      'active' if analytics.analyticsTimeLabel() is 'Last 24 Hours'


  return AnalyticsTimePopTemplate self
