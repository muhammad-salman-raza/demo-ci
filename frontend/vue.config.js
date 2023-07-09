module.exports = {
  runtimeCompiler: true,
  devServer: {
    headers: {
      "Referrer-Policy": "no-referrer"
    }
  },
  transpileDependencies: [],
  configureWebpack: {
    entry: './src/main.ts',
    resolve: {
      extensions: ['.ts', '.tsx', '.js', '.jsx', '.vue', '.json'],
    },
  },
};
