var path = require("path");
var webpack = require("webpack");
module.exports = {
  context: __dirname,
  entry: {
    restaurants_index: './js/entry/restaurants_index.js',
    menu_show: './js/entry/menu_show.js'
  },
  output: {
    path: path.join(__dirname, 'app', 'assets', 'javascripts', 'bundle'),
    filename: '[name]_bundle.js',
    publicPath: '/js/'
  },
  plugins: [
    new webpack.ResolverPlugin(
      new webpack.ResolverPlugin.DirectoryDescriptionFilePlugin("bower.json", ["main"])
    )
  ]
};
