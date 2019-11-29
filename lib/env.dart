// 本番ビルドかを判定
import 'package:flutter/cupertino.dart';

const bool isProduction = bool.fromEnvironment('dart.vm.product');

const testConfig = {
  'baseUrl': 'some-url.test',
  'baseColor':  0xFFe79686
};

const productionConfig = {
  'baseUrl': 'some-url.com',
  'baseColor': 0xFFe79686
};


class AppConfig {
  final String appName;
  final Color baseColor;
  final Color bottomNavBarColor;
  final String apiBaseUrl;
  final Widget child;

  AppConfig(this.appName, this.baseColor, this.bottomNavBarColor, this.apiBaseUrl, this.child);
}
