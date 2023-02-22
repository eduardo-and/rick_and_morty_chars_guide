import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty_guide/src/app_provider.dart';
import 'package:rick_and_morty_guide/src/core/theme/rmg_gradients.dart';
import 'package:rick_and_morty_guide/src/core/theme/rmg_images.dart';
import 'package:rick_and_morty_guide/src/core/utils/extensions/numbers_extension.dart';

import '../../../../core/theme/store/theme_store.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) =>
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/home', (route) => false));
  }

  final themeStore = getIt<ThemeStore>();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(body: Observer(builder: (_) {
      return Container(
        decoration: BoxDecoration(
            gradient: themeStore.themeMode == ThemeMode.light
                ? RMGGradients.lightGreenSplashBackground
                : RMGGradients.darkGreenSplashBackground),
        child: Center(
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      RMGImages.logo,
                      matchTextDirection: true,
                      allowDrawingOutsideViewBox: true,
                      excludeFromSemantics: true,
                    ),
                    SizedBox(
                      height: 20.scale,
                    ),
                    CircularProgressIndicator(
                      color: theme.primaryColorLight,
                      backgroundColor: theme.colorScheme.primary,
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Image.asset(
                  scale: 2.scale,
                  RMGImages.splash,
                ),
              ),
            ],
          ),
        ),
      );
    }));
  }
}
