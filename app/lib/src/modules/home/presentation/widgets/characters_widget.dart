import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rick_and_morty_guide/src/core/theme/rmg_colors.dart';
import 'package:rick_and_morty_guide/src/core/theme/rmg_colors_light.dart';
import 'package:rick_and_morty_guide/src/core/utils/extensions/numbers_extension.dart';
import 'package:rick_and_morty_guide/src/modules/home/domain/enum/enum_list_state.dart';
import 'package:rick_and_morty_guide/src/modules/home/presentation/widgets/filters_widet.dart';

import '../../../../app_provider.dart';
import '../controller/home_controller.dart';
import 'card_widget.dart';
import 'chip_widget.dart';

class CharactersWidget extends StatefulWidget {
  const CharactersWidget({super.key});

  @override
  State<CharactersWidget> createState() => _CharactersWidgetState();
}

class _CharactersWidgetState extends State<CharactersWidget>
    with AutomaticKeepAliveClientMixin<CharactersWidget> {
  late final ScrollController scrollController;

  final HomeController controller = getIt<HomeController>();

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(handleScroll);
    controller.pipeline();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Stack(
        children: [
          Positioned(
              top: 0,
              child: Container(
                  alignment: Alignment.centerLeft, child: FiltersWidget())),
          Padding(
            padding: EdgeInsets.only(top: 60.scale),
            child: Center(
              child: ListView.builder(
                controller: scrollController,
                itemCount: controller.characters.length,
                itemBuilder: (BuildContext context, int index) {
                  return CardWidget(char: controller.characters[index]);
                },
              ),
            ),
          ),
          controller.listState.isloading ? loadList() : const SizedBox()
        ],
      );
    });
  }

  Widget loadList() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 10,
      child: SizedBox(
        height: 40.scale,
        width: 40.scale,
        child: CircleAvatar(
            child: SizedBox(
                height: 20.scale,
                width: 20.scale,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  backgroundColor: RMGColorsLight().tertiary,
                ))),
      ),
    );
  }

  handleScroll() {
    if (scrollController.position.pixels >
        scrollController.position.maxScrollExtent - 20) {
      controller.getCharacters();
    }
  }

  @override
  bool get wantKeepAlive => true;
}
