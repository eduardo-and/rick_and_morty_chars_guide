import 'package:flutter/material.dart';
import '../theme/rmg_colors.dart';
import '../theme/rmg_images.dart';

class ErrorModal {
  void show(BuildContext context, Function onPressed) {
    final theme = Theme.of(context);
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: WillPopScope(
              onWillPop: () async {
                return false;
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(RMGImages.failure),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('Failed to Get Data!', style: theme.textTheme.subtitle1),
                  Text(
                    'Something unexpected happened during the receiving the data. Please try again to continue!',
                    style: theme.textTheme.overline,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      onPressed();
                    },
                    child: Text('Try again',
                        style: theme.textTheme.button!
                            .copyWith(color: Colors.blueAccent)),
                  )
                ],
              ),
            ),
          );
        });
  }
}
