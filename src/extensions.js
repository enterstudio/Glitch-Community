"use strict";

// Extend promises with `finally`
// From: https://github.com/domenic/promises-unwrapping/issues/18
if (Promise.prototype.finally == null) { Promise.prototype.finally = function(callback) {
  // We don’t invoke the callback in here,
  // because we want then() to handle its exceptions
  return this.then(
    // Callback fulfills: pass on predecessor settlement
    // Callback rejects: pass on rejection (=omit 2nd arg.)
    value =>
      Promise.resolve(callback())
        .then(() => value)
    ,
    reason =>
      Promise.resolve(callback())
        .then(function() { throw reason; })
  );
}; }

if (Promise.prototype._notify == null) { Promise.prototype._notify = function(event) {
  return this._progressHandlers.forEach(function(handler) {
    try {
      return handler(event);
    } catch (error) {}
  });
}; }

if (Promise.prototype.progress == null) { Promise.prototype.progress = function(handler) {
  if (this._progressHandlers == null) { this._progressHandlers = []; }
  this._progressHandlers.push(handler);

  return this;
}; }

global.ProgressPromise = function(fn) {
  var p = new Promise(function(resolve, reject) {
    const notify = () =>
      p._progressHandlers != null ? p._progressHandlers.forEach(function(handler) {
        try {
          return handler(event);
        } catch (error) {}
      }) : undefined
    ;

    return fn(resolve, reject, notify);
  });

  p.then = function(onFulfilled, onRejected) {
    const result = Promise.prototype.then.call(p, onFulfilled, onRejected);
    // Pass progress through
    p.progress(result._notify.bind(result));

    return result;
  };

  return p;
};

// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/includes
const includes = function(searchElement) {
  let k;
  const O = Object(this);
  const len = parseInt(O.length) || 0;
  if (len === 0) { return false; }

  const n = parseInt(arguments[1]) || 0;

  if (n >= 0) {
    k = n;
  } else {
    k = len + n;
    if (k < 0) { k = 0; }
  }

  while (k < len) {
    const currentElement = O[k];
    if ((searchElement === currentElement) || ((searchElement !== searchElement) && (currentElement !== currentElement))) { // NaN != NaN
      return true;
    }
    k++;
  }

  return false;
};

Array.prototype.includes || Object.defineProperty(Array.prototype, "includes",
  {value: includes});

// http://stackoverflow.com/questions/3446170/escape-string-for-use-in-javascript-regex
if (RegExp.escape == null) { RegExp.escape = str => str.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, "\\$&"); }

if (Number.MAX_SAFE_INTEGER == null) { Number.MAX_SAFE_INTEGER = 9007199254740991; }

module.exports = {includes};
