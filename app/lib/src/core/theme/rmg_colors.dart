import 'package:flutter/material.dart';

import 'rmg_colors_dark.dart';
import 'rmg_colors_light.dart';
import 'i_rmg_colors.dart';

class RMGColors {
  RMGColors._();

  static IRMGColors of(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? RMGColorsLight()
        : RMGColorsDark();
  }
}
