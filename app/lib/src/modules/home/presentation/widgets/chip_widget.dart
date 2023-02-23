import 'package:flutter/material.dart';
import 'package:rick_and_morty_guide/src/core/utils/extensions/numbers_extension.dart';

import '../../../../core/theme/rmg_colors_light.dart';

class ChipWidget extends StatelessWidget {
  final bool isSelected;
  final String label;
  final ValueChanged<bool> onSelected;
  final bool purple;

  const ChipWidget({
    required this.isSelected,
    required this.label,
    required this.onSelected,
    required this.purple,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    Color color = theme.colorScheme.tertiary.withOpacity(0.8);
    Color textColor = theme.textTheme.caption!.color!;

    if (isSelected) {
      color =
          purple ? RMGColorsLight().complementary : RMGColorsLight().secundary;
      textColor = RMGColorsLight().tertiary;
    }

    return Material(
      color: color,
      borderRadius: BorderRadius.circular(25.scale),
      child: InkWell(
        splashColor: textColor,
        borderRadius: BorderRadius.circular(25.scale),
        onTap: () {
          onSelected(!isSelected);
        },
        child: Container(
          decoration: BoxDecoration(
            // color: color,
            borderRadius: BorderRadius.circular(25.scale),
          ),
          padding: EdgeInsets.symmetric(
            vertical: 5.0.scale,
            horizontal: 12.0.scale,
          ),
          child: Text(
            label,
            style: theme.textTheme.button!.merge(
              TextStyle(
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
