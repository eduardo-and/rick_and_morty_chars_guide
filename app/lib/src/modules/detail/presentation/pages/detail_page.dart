import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rick_and_morty_guide/src/core/utils/extensions/numbers_extension.dart';
import 'package:rick_and_morty_guide/src/modules/home/presentation/controller/home_controller.dart';

import '../../../../app_provider.dart';
import '../../../../core/domain/entities/character_entity.dart';
import '../../../../core/theme/rmg_colors_light.dart';
import '../../../../core/theme/rmg_icons.dart';
import '../../../../core/theme/store/theme_store.dart';

class CharDetailPage extends StatefulWidget {
  Character char;

  CharDetailPage({super.key, required this.char});

  @override
  State<CharDetailPage> createState() => _CharDetailPageState();
}

class _CharDetailPageState extends State<CharDetailPage> {
  final _themeStore = getIt<ThemeStore>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.arrow_back, color: RMGColorsLight().secundary)),
        automaticallyImplyLeading: false,
        actions: [
          Observer(builder: (context) {
            return IconButton(
                onPressed: () => _themeStore.toggleThemeMode(),
                icon: _themeStore.themeMode == ThemeMode.light
                    ? Icon(RMGIcons.dark,
                        color: Theme.of(context).colorScheme.onBackground)
                    : Icon(RMGIcons.darkFill,
                        color: Theme.of(context).colorScheme.onBackground));
          })
        ],
        elevation: 0,
        title: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 5.scale),
              child: Text('${'Rick and Morty'} ',
                  style: theme.textTheme.subtitle2),
            ),
            Text(
              'Guide',
              style: theme.textTheme.subtitle2!
                  .copyWith(color: RMGColorsLight().secundary),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.scale),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 25.scale),
                Stack(
                  children: [
                    Container(
                      width: (size.width * 0.60).scale,
                      height: (size.width * 0.60).scale,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: RMGColorsLight().secundary, width: 2),
                          image: DecorationImage(
                              image: NetworkImage(widget.char.image))),
                    ),
                    Positioned(
                      right: 15,
                      top: 2,
                      child: IconButton(
                        onPressed: () {
                          getIt<HomeController>()
                              .handleTapFavorite(widget.char.id);
                          setState(() {
                            widget.char = widget.char.copyWith(
                                isFavorite: !(widget.char.isFavorite));
                          });
                        },
                        icon: Icon(
                          widget.char.isFavorite
                              ? RMGIcons.favoriteFill
                              : RMGIcons.favorite,
                          size: 50,
                        ),
                        color: RMGColorsLight().secundary,
                      ),
                    )
                  ],
                ),
                Text(
                  widget.char.name,
                  style: theme.textTheme.headline3,
                ),
                Text(widget.char.type, style: theme.textTheme.caption),
                SizedBox(
                  height: 20.scale,
                ),
                lineDescription('Status', widget.char.status, theme),
                lineDescription('Type', widget.char.type, theme),
                lineDescription('Gender', widget.char.gender.toString(), theme),
                lineDescription('Origin', widget.char.origin, theme),
                lineDescription('Location', widget.char.location, theme),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.scale),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(RMGIcons.tv,
                      color: RMGColorsLight().secundary, size: 35),
                  SizedBox(
                    width: 10.scale,
                  ),
                  Text('Present in ${widget.char.episodes} episode(s)'),
                  SizedBox(
                    height: 20.scale,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget lineDescription(String title, String content, ThemeData theme) {
    return Padding(
      padding: EdgeInsets.only(top: 10.scale),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$title:',
            style: theme.textTheme.bodyText1,
          ),
          Text(
            content == '' ? '-' : content,
            style: theme.textTheme.bodyText2,
          )
        ],
      ),
    );
  }
}
