const OFF = 0;
const WARN = 1;
const ERROR = 2;

module.exports = exports = {
  extends: "eslint:recommended",
  env: {
      'es6': true,        // We are writing ES6 code
      'node': true,       // for Node.js
  },
  parser: "babel-eslint",
  rules: {
    "no-console": OFF,
  }
}
