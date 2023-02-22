import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rick_and_morty_guide/src/core/domain/entities/character_entity.dart';
import 'package:rick_and_morty_guide/src/core/theme/rmg_colors_light.dart';
import 'package:rick_and_morty_guide/src/core/utils/extensions/numbers_extension.dart';
import 'package:rick_and_morty_guide/src/modules/home/presentation/controller/home_controller.dart';

import '../../../../../app_provider.dart';
import '../../../../../core/theme/rmg_gradients.dart';
import '../../../../../core/theme/rmg_icons.dart';
import '../../../../../core/theme/rmg_images.dart';
import '../../../../../core/theme/store/theme_store.dart';

class CardWidget extends StatelessWidget {
  final int index;
  CardWidget({
    super.key,
    required this.index,
  });

  final themeStore = getIt<ThemeStore>();

  final controller = getIt<HomeController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return InkWell(
      onTap: () => Navigator.of(context)
          .pushNamed('/detail', arguments: controller.characters[index]),
      child: Container(
        alignment: Alignment.center,
        margin:  EdgeInsets.symmetric(vertical: 10.scale, horizontal: 30.scale),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                spreadRadius: 3,
                blurRadius: 5,
                offset: Offset(1, 2))
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Stack(
              children: [
                Container(
                  height: 109.scale,
                  width: (size.width * 0.85).scale,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(RMGImages.noise),
                        fit: BoxFit.fill,
                        opacity: 0.05),
                    gradient: themeStore.themeMode == ThemeMode.light
                        ? RMGGradients.glassmorphism
                        : RMGGradients.glassmorphismDark,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        width: 0.5,
                        color: themeStore.themeMode == ThemeMode.light
                            ? Colors.white30
                            : Colors.white.withOpacity(0.05)),
                  ),
                  child: Padding(
                    padding:  EdgeInsets.all(10.0.scale),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            width: (size.width * 0.85 - 25).scale,
                            height: 109.scale,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: ((size.width * 0.85) * 0.35).scale,
                                  top: 0,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: ((size.width * 0.85) * 0.45).scale,
                                        child: Text(
                                          controller.characters[index].name,
                                          style: theme.textTheme.subtitle1,
                                        ),
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(300),
                                            child: Container(
                                              width: 7.scale,
                                              height: 7.scale,
                                              color: Colors.green,
                                            ),
                                          ),
                                           SizedBox(
                                            width: 7.scale,
                                          ),
                                          Text(
                                              controller
                                                  .characters[index].status,
                                              style: theme.textTheme.caption),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                    right: 0,
                                    bottom: 0,
                                    child: Text(
                                      controller.characters[index].type,
                                      style: theme.textTheme.headline4!
                                          .copyWith(
                                              color: theme.colorScheme.onSurface
                                                  .withOpacity(0.15),
                                              fontSize: controller
                                                          .characters[index]
                                                          .type
                                                          .length >
                                                      10
                                                  ? 15.scale
                                                  : 25.scale),
                                    )),
                                Observer(builder: (_) {
                                  return Positioned(
                                    right: -10,
                                    top: -10,
                                    child: IconButton(
                                        onPressed: () {
                                          controller.handleTapFavorite(
                                              controller.characters[index].id);
                                        },
                                        icon: Icon(
                                          controller
                                                  .characters[index].isFavorite
                                              ? RMGIcons.favoriteFill
                                              : RMGIcons.favorite,
                                          color: RMGColorsLight().secundary,
                                        )),
                                  );
                                }),
                              ],
                            ),
                          ),
                        ]),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5)),
                    child: Image.network(
                      controller.characters[index].image,
                      width: (size.width * 0.85) * 0.35,
                      fit: BoxFit.cover,
                      // fit: BoxFit.fill,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
