import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import '../../../../app_provider.dart';
import '../../../../core/theme/rmg_gradients.dart';
import '../../../../core/utils/extensions/numbers_extension.dart';
import '../../domain/enum/enum_state.dart';
import '../widgets/app_bar_widget.dart';

import '../../../../core/theme/store/theme_store.dart';
import '../../../../core/widgets/error_modal.dart';
import '../../home_provider.dart';
import '../controller/home_controller.dart';
import 'widgets/characters_widget.dart';
import 'widgets/favorites_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final HomeController controller;

  @override
  void initState() {
    super.initState();
    homeProvider();
    controller = getIt<HomeController>();
    controller.pipeline();
  }

  @override
  Widget build(BuildContext context) {
    reaction((_) {
      if (controller.controllerState.isFailure) {
        ErrorModal().show(context, () {
          controller.pipeline();
        });
      }
    }, (_) {});

    final themeStore = getIt<ThemeStore>();
    return DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          appBar: CustomAppBar(height: 160.scale),
          body: Observer(builder: (_) {
            if (controller.controllerState.isLoading ||
                controller.controllerState.isStart) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return TabBarView(children: [
              Container(
                decoration: BoxDecoration(
                    gradient: themeStore.themeMode == ThemeMode.light
                        ? RMGGradients.lightGreenBackground
                        : RMGGradients.darkGreenBackground),
                child: const CharactersWidget(),
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: themeStore.themeMode == ThemeMode.light
                        ? RMGGradients.lightPurpleBackground
                        : RMGGradients.darkPurpleBackground),
                child: const FavoritesWidget(),
              ),
            ]);
          }),
        ));
  }
}
