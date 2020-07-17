
const { environment } = require("@rails/webpacker");
const webpack = require("webpack");


environment.plugins.prepend(
  "Provide",
  new webpack.ProvidePlugin({
    $: "jquery/src/jquery",
    jQuery: "jquery/src/jquery",
  })
);

// const { environment } = require("@rails/webpacker");
// const webpack = require("webpack");

// environment.plugins.prepend(
//   "Provide",
//   new webpack.ProvidePlugin({
//     $: "jquery",
//     jQuery: "jquery",
//     jquery: "jquery",
//   })
// );

module.exports = environment;
