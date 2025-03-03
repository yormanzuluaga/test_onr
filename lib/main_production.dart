// ignore_for_file: prefer_const_constructors

import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:onr_test/bootstrap.dart';
import 'package:onr_test/flavor.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  bootstrap(
    flavor: FlavorType.dev,
  );
}
