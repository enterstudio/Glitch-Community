const path = require('path');
const UglifyJsPlugin = require('uglifyjs-webpack-plugin');
const webpack = require('webpack');



const PUBLIC = path.resolve(__dirname, 'public');
const SRC = path.resolve(__dirname, 'src');
const BASE = path.resolve(__dirname, '.');


module.exports = () => {
  
  let plugins = [];
  if(process.env.NODE_ENV === 'production') {
    plugins = [
      new UglifyJsPlugin({
        cache: true,
        sourceMap: true,
        uglifyOptions: {
          ecma: 6,
          mangle: true,
          compress: true
        }
      }),
     //https://webpack.js.org/guides/production/#specify-the-environment
     new webpack.DefinePlugin({
       'process.env.NODE_ENV': JSON.stringify('production')
     })
    ];
  }
  
  return {
    entry: {
      "client-bundle": `${SRC}/client.js`
    },
    output: {
      filename: '[name].js',
      path: PUBLIC
    },
    devtool: 'source-map',
    module: {
      rules: [
        {
          enforce: "pre",
          test: /\.jsx?$/,
          exclude: /node_modules/,
          loader: "eslint-loader",
          options: {
            fix: false, // We can turn this on once OTFS is live
            cache: false, //caching tends to make the config stick, so turn it off deliberately :(
            emitError: true,
            emitWarning: true,
            failOnError: false,
          }
        },
        {
          test: /\.jsx?/,
          include: SRC,
          loader : 'babel-loader'
        }
      ],
    },
    plugins: plugins
  };
}
