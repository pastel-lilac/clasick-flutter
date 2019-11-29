// 本番ビルドかを判定
const bool isProduction = bool.fromEnvironment('dart.vm.product');

const testConfig = {
  'baseUrl': 'some-url.test'
};

const productionConfig = {
  'baseUrl': 'some-url.com'
};

final environment = isProduction ? productionConfig : testConfig;