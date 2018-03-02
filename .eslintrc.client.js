const OFF = 0;
const WARN = 1;
const ERROR = 2;

module.exports = exports = {
  "extends": "eslint:recommended", // Turn this on after the coffee -> es conversion
  env: {
      'es6': true,        // We are writing ES6 code
      'browser': true,    // for the browser
      //'commonjs': true, // Turn this on after the coffee -> es conversion
  },
  "parser": "babel-eslint",
  "parserOptions": {
    "sourceType": "module",
    "allowImportExportEverywhere": true
  },
  "rules": {
    // Intentionally off:
    "no-console": OFF,
    
    // Unintentionally off -- we should fix these, then enable them
    "no-undef": OFF,
    "no-unused-vars": OFF,
    "no-useless-escape": OFF,
    "no-empty": OFF,
  }
}
