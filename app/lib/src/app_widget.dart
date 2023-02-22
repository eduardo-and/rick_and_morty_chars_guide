import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rick_and_morty_guide/src/app_provider.dart';
import 'package:rick_and_morty_guide/src/core/domain/entities/character_entity.dart';
import 'package:rick_and_morty_guide/src/core/theme/rmg_themes.dart';
import 'package:rick_and_morty_guide/src/modules/home/presentation/page/home_page.dart';

import 'core/theme/store/theme_store.dart';
import 'modules/detail/presentation/pages/detail_page.dart';
import 'modules/splash/presentation/page/splash_page.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    final ThemeStore themeStore = getIt<ThemeStore>();

    return Observer(builder: (_) {
      return MaterialApp(
          title: 'Rick and Morty Guide',
          theme: RMGThemes.light,
          darkTheme: RMGThemes.dark,
          debugShowCheckedModeBanner: false,
          themeMode: themeStore.themeMode,
          routes: {
            '/': (context) => const SplashPage(),
            '/home': (context) => const HomePage(),
            '/detail': (context) => CharDetailPage(
                char: ModalRoute.of(context)!.settings.arguments as Character),
          },
          initialRoute: '/');
    });
  }
}
