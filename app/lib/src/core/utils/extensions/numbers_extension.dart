import 'package:flutter/material.dart';

screenAdapter() {
  Size size = MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;
  final double factor = (size.height * size.width) / 10000;
  if (factor <= 19) {
    return 0.8;
  } else if (factor > 19 && factor <= 24) {
    return 0.9;
  } else if (factor > 25 && factor <= 35) {
    return 1.0;
  } else if (factor > 35 && factor <= 40) {
    return 1.3;
  } else {
    return 1.5;
  }
}

extension ScreenFactor on double {
  double get scale => this * screenAdapter();
}

extension ScreenFactorInt on int {
  double get scale => (this * screenAdapter()).toDouble();
}
