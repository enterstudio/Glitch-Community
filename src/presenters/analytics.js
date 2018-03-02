// TODO: This file was created by bulk-decaffeinate.
// Check that you're happy with the conversion, then remove this comment.
/*
 * decaffeinate suggestions:
 * DS101: Remove unnecessary use of Array.from
 * DS102: Remove unnecessary code created because of implicit returns
 * DS201: Simplify complex destructure assignments
 * DS207: Consider shorter variations of null checks
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
// todo convert to async await fetch
// todo do accessibility w hidden tables

const Observable = require('o_0');
const axios = require('axios');
const _ = require('lodash/function');
const moment = require('moment');

const AnalyticsTemplate = require("../templates/includes/analytics");
const AnalyticsTimePopPresenter = require("./pop-overs/analytics-time-pop");
const AnalyticsProjectsPopPresenter = require("./pop-overs/analytics-projects-pop");

const METRICS = ["remixes", "visits"];
const REFERRER_FIELDS = ["remixReferrers", "referrers"];
const REFERRER_VALUES = ["remixes", "requests"];
const COLORS = ["#70ECFF", "#F2A2FF"];
const LINE_COLOR = "#c3c3c3";
const BACKGROUND_COLOR = '#f5f5f5';
// HEIGHTS = [200, 200]

const twoWeeks = moment().subtract(2, 'weeks').valueOf();
const fourWeeks = moment().subtract(4, 'weeks').valueOf();
const oneDay = moment().subtract(24, 'hours').valueOf();

// Crack open a promise so anyone can resolve or reject it later
const OpenPromise = function() {
  let resolve = null;
  let reject = null;
  const p = new Promise(function(_resolve, _reject) {
    resolve = _resolve;
    return reject = _reject;
  });

  p.resolve = resolve;
  p.reject = reject;

  return p;
};

const sum = array =>
  array.reduce((a, b) => a + b
  , 0)
;

module.exports = function(application, teamOrProject) {
  const plotlyPromise = OpenPromise();

  var self = { 

    // analyticsTimeLabel: application.analyticsTimeLabel
    // analyticsProjectDomain: application.analyticsProjectDomain

    remixesChartElement: document.createElement('div'),
    remixesReferrersBars: document.createElement('referrer-bars'),

    visitsChartElement: document.createElement('div'),
    visitsReferrersBars: document.createElement('referrer-bars'),

    gettingAnalytics: Observable(true),
    gettingAnalyticsFromDate: Observable(false),
    gettingAnalyticsProjectDomain: Observable(false),
    // analyticsFromDate: Observable twoWeeks
    analyticsProjectDomain: Observable('All Projects'),
    analyticsTimeLabel: Observable('Last 2 Weeks'),
    
    analyticsFromDate() {
      if (self.analyticsTimeLabel() === 'Last 4 Weeks') {
        return fourWeeks;
      } else if (self.analyticsTimeLabel() === 'Last 24 Hours') {
        return oneDay;
      } else {
        return twoWeeks;
      }
    },
    
    // showRemixesReferrers: Observable false
    totalRemixes: Observable(0),
    // showVisitsReferrers: Observable false
    totalVisits: Observable(0),
    
    // PK: width of what text? is this a character spacing thing?
    // ET: this is the method we use to calculate the left margin of the two charts
    //     this way, the two charts have the same left margin
    // PK: that makes sense. I think it'd be clearer to future us if it was called something like
    // `getWidthOfYAxisLabel`. 'text' is too generic
    getWidthOfText(txt, fontname, fontsize) {
      const f = self.getWidthOfText;
      if (f.c === undefined) {
        f.c = document.createElement('canvas');
        f.ctx = f.c.getContext('2d');
      }
      f.ctx.font = fontsize + ' ' + fontname;
      return f.ctx.measureText(txt).width;
    },

    // PK: not sure what's a param here. is it a plotly specific thing?
    // ET: they are chart params: the left margin and the y-range
    calculateParams(chartData) {
      const maxes = chartData.map(data => Math.max(...Array.from(data.y || [])));
      const digits = maxes.map(max => Math.ceil(Math.log10(max)));
      let maxDigits = Math.max(...Array.from(digits || []));
      if (maxDigits <= 0) {
        maxDigits = 1;
      }
      // PK: what is 's'?
      // ET: It is just a temporary variable used to store the string with which
      //     we are going to calculate the width of the left margin
      // PK: is it used anywhere? I see it's definition, but no other references to it
      // ET: it is used 4 lines below...
      let leftMarginString = __range__(1, maxDigits, true).reduce((a, b) => a + "9"
      , "9"); // we add one digit because the histogram may aggregate buckets together
      leftMarginString = Plotly.d3.format(',dr')(parseInt(leftMarginString));

      return {
        leftMargin: self.getWidthOfText(leftMarginString, "Benton Sans", "14px"), // super gross
        ranges: maxes.map(function(max) {
          if (max >= 3) { return undefined; } else { return [0, 3]; }})
      };
    },

    initCharts() {
      console.log('Plotly ready', Plotly);

      const elements = [
        self.remixesChartElement,
        self.visitsChartElement
      ];
      return elements.map(function(element, i) {
        const data = {
          marker: {
            color: COLORS[i]
          },
          type: 'histogram',
          histfunc: "sum",
          nbinsx: 28
        };

        const layout = {
          paper_bgcolor: BACKGROUND_COLOR,
          plot_bgcolor: BACKGROUND_COLOR,
          font: {
            family: '"Benton Sans",Helvetica,Sans-serif'
          },
          height: 200,
          margin: {
            l: 0,
            r: 0,
            b: 50,
            t: 10,
            pad: 0
          },
          bargap: 0.2
        };

        const options =
          {displayModeBar: false};

        return Plotly.newPlot(element, [data], layout, options);
      });
    },

    updateCharts(analyticsData) {
      let calculatedParams;
      const chartData = self.mapChartData(analyticsData);

      self.updateTotals(chartData);

      const {leftMargin, ranges} = (calculatedParams = self.calculateParams(chartData));
      console.log('calculateParams', calculatedParams);

      const elements = [
        self.remixesChartElement,
        self.visitsChartElement
      ];

      return chartData.map(function(data, i) {

        const layout = {
          margin: {
            l: leftMargin,
            r: 0,
            b: 50,
            t: 10,
            pad: 0
          },
          xaxis: {
            zeroline: false,
            showline: true,
            linecolor: LINE_COLOR,
            type: "date",
            showgrid: true,
            autorange: false,
            fixedrange: true,         
            //tickangle: 1e-10 # to have it aligned to the right of the tick          xaxis:
            range: [data.x[0].getTime() - 3600000, data.x[data.x.length-1].getTime() + (4 * 3600000)]
          },
          yaxis: {
            fixedrange: true,
            rangemode: "nonnegative",
            tickformat: ',dr',
            zeroline: false,
            range: ranges[i]
          }
        };


        data.x = [data.x];
        data.y = [data.y];

        const element = elements[i];
        return Plotly.update(element, data, layout);
      });
    },

    drawCharts(chartData) {
      self.initCharts();
      return self.updateCharts(chartData);
    },

    updateTotals(...args) {
      const [remixData, visitsData] = Array.from(args[0]);
      const formatter = Plotly.d3.format(',dr');
      self.totalRemixes(formatter(sum(remixData.y)));
      return self.totalVisits(formatter(sum(visitsData.y)));
    },
      
    initReferrers() {
      const elements = [
        self.remixesReferrersBars,
        self.visitsReferrersBars
      ];

      return elements.map(function(element, i) {
        const data = {
          hoverinfo: 'none',
          marker: {
            color: COLORS[i]
          },
          type: 'bar',
          orientation: 'h'
        };

        const layout = {
          paper_bgcolor: BACKGROUND_COLOR,
          plot_bgcolor: BACKGROUND_COLOR,
          font: {
            family: '"Benton Sans",Helvetica,Sans-serif',
            size: 14
          },
          margin: {
            l: 0,
            r: 10,
            b: 10,
            t: 10,
            pad: 0
          },
          barwidth: 20,
          xaxis: {
            showticklabels: false,
            showgrid: false,
            zeroline: false,
            fixedrange: true
          },
          yaxis: {
            showticklabels: false,
            fixedrange: true
          }
        };

        const options =
          {displayModeBar: false};

        return Plotly.newPlot(element, [data], layout, options);
      });
    },
        
    updateReferrers(analyticsData) {
      const elements = [
        self.remixesReferrersBars,
        self.visitsReferrersBars
      ];

      return REFERRER_FIELDS.map(function(field, i) {
        const referrerValue = REFERRER_VALUES[i];
        const makeObj = function(key, val) {
          const obj = {};
          obj[key] = val;
          return obj;
        };
        
        let total = analyticsData[field].reduce((a, b) => makeObj(referrerValue, a[referrerValue] + b[referrerValue])
        , makeObj(referrerValue, 0));
        total = total[REFERRER_VALUES[i]];

        let referrers = analyticsData[field].filter((r, i) => !r.self && (i < 5));
        // invert them
        referrers = referrers.reverse();
        referrers = referrers.map(r =>
          ({
            domain: r.domain,
            value: r[REFERRER_VALUES[i]]
          }));

        // NOTE: Plotly.restyle wants the arrays pushed down into the trace values YOLO!
        const data = {
          x: [referrers.map(r => r.value)],
          y: [referrers.map(r => r.domain)]
        };
        
        const layout = {
          annotations: referrers.map(r =>
            ({
              x: 0,
              y: r.domain,
              showarrow: false,
              text: `${r.value} - ${r.domain}`,
              xanchor: "left",
              xshift: 5
            })
          ),
          height: 20 + (30 * referrers.length)
        };

        const element = elements[i];
        return Plotly.update(element, data, layout);
      });
    },

    drawReferrers(analyticsData) {
      self.initReferrers();
      return self.updateReferrers(analyticsData);
    },
    
    mapChartData(data) {
      const {buckets} = data;

      return METRICS.map((metric, i) =>
        ({
          x: buckets.map(x => new Date(x.startTime)),
          y: buckets.map(y => y.analytics[metric] != null ? y.analytics[metric] : 0)
        })
      );
    },

    plotlyLoad(e) {
      console.log("Plotly Load", e);
      self.initReferrers();
      self.initCharts();

      return plotlyPromise.resolve();
    },      

    getAnalyticsData(fromDate, projectDomain) {
      let analyticsPath;
      self.gettingAnalytics(true);
      const id = teamOrProject.id();
      const { CancelToken } = axios;
      const source = CancelToken.source();
      if (projectDomain === 'All Projects') {
        analyticsPath = `analytics/${id}/team?from=${fromDate}`;
      } else {
        analyticsPath = `analytics/${id}/project/${projectDomain}?from=${fromDate}`;
      }

      return application.api(source).get(analyticsPath)
      .then(({data}) =>
        plotlyPromise.then(function() {
          self.gettingAnalytics(false);
          self.gettingAnalyticsFromDate(false);
          self.gettingAnalyticsProjectDomain(false);

          self.updateCharts(data);
          return self.updateReferrers(data);
        })
      );
    },

    toggleAnalyticsTimePop(event) {
      event.stopPropagation();
      const element = event.currentTarget;
      const existingPop = element.querySelector(".analytics-time-pop");
      application.closeAllPopOvers();

      if (!existingPop) {
        return element.parentElement.appendChild(AnalyticsTimePopPresenter(application, self));
      }
    },

    toggleAnalyticsProjectsPop(event) {
      event.stopPropagation();
      const element = event.currentTarget;
      const existingPop = element.querySelector(".analytics-projects-pop");
      application.closeAllPopOvers();

      if (!existingPop) {
        return element.parentElement.appendChild(AnalyticsProjectsPopPresenter(application, self));
      }
    },

    hiddenUnlessGettingAnalytics() {
      if (!self.gettingAnalytics()) { return 'hidden'; }
    },

    hiddenUnlessGettingAnalyticsFromDate() {
      if (!self.gettingAnalyticsFromDate()) { return 'hidden'; }
    },

    hiddenUnlessGettingAnalyticsProjectDomain() {
      if (!self.gettingAnalyticsProjectDomain()) { return 'hidden'; }
    },

    currentUserIsOnTeam() {
      return application.team().currentUserIsOnTeam(application);
    },

    hiddenUnlessCurrentUserIsOnTeam() {
      if (!self.currentUserIsOnTeam(application)) { return 'hidden'; }
    }
  };


  window.addEventListener('resize', _.throttle(function() {
    Plotly.Plots.resize(self.remixesChartElement);
    Plotly.Plots.resize(self.remixesReferrersBars);
    Plotly.Plots.resize(self.visitsChartElement);
    return Plotly.Plots.resize(self.visitsReferrersBars);
  }
  , 50)
  );

  // Bind a function to rerun and fetch the analytics data when the dependent observables change
  Observable(function() {
    const fromDate = self.analyticsFromDate();
    const projectDomain = self.analyticsProjectDomain();

    return self.getAnalyticsData(fromDate, projectDomain);
  });

  return AnalyticsTemplate(self);
};

function __range__(left, right, inclusive) {
  let range = [];
  let ascending = left < right;
  let end = !inclusive ? right : ascending ? right + 1 : right - 1;
  for (let i = left; ascending ? i < end : i > end; ascending ? i++ : i--) {
    range.push(i);
  }
  return range;
}