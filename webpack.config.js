var path = require("path");
var webpack = require("webpack");
module.exports = {
  context: __dirname,
  entry: {
    app: './js/entry/app.js',
    landing_page: './js/entry/landing_page.js',
    restaurants_index: './js/entry/restaurants_index.js',
    menu_show: './js/entry/menu_show.js',
    about: './js/entry/about.js',
    menu_bill: './js/entry/menu_bill.js',
    restaurant_show: './js/entry/restaurant_show.js',
    order_new: './js/entry/order_new.js',
    histroy: './js/entry/histroy.js'
  },
  output: {
    path: path.join(__dirname, 'app', 'assets', 'javascripts', 'bundle'),
    filename: '[name]_bundle.js',
    publicPath: '/js/'
  },
  module: {
    loaders: [
      { test: /\.js$/, loader:'babel-loader' },
    ]
  },
  plugins: [
    new webpack.ResolverPlugin(
      new webpack.ResolverPlugin.DirectoryDescriptionFilePlugin("bower.json", ["main"])
    )
  ]
};
