import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../../app_provider.dart';
import '../../controller/home_controller.dart';

import 'card_widget.dart';
import 'filters_widet.dart';

class FavoritesWidget extends StatefulWidget {
  const FavoritesWidget({super.key});

  @override
  State<FavoritesWidget> createState() => _FavoritesWidgetState();
}

class _FavoritesWidgetState extends State<FavoritesWidget>
    with AutomaticKeepAliveClientMixin<FavoritesWidget> {
  @override
  void initState() {
    super.initState();
  }

  final controller = getIt<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
                alignment: Alignment.centerLeft,
                child: FiltersWidget(
                  purple: true,
                )),
            Expanded(
              child: ListView.builder(
                itemCount: controller.favoriteCharacters.length,
                itemBuilder: (BuildContext context, int index) {
                  return CardWidget(char: controller.favoriteCharacters[index]);
                },
              ),
            )
          ]);
    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
