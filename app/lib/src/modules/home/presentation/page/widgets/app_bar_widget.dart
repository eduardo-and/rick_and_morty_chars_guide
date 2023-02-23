import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../../app_provider.dart';
import '../../../../../core/theme/rmg_colors_light.dart';
import '../../../../../core/utils/extensions/numbers_extension.dart';
import '../../controller/home_controller.dart';

import '../../../../../core/theme/rmg_fonts.dart';
import '../../../../../core/theme/rmg_icons.dart';
import '../../../../../core/theme/store/theme_store.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  final bool back;
  const CustomAppBar({Key? key, required this.height, this.back = false})
      : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _CustomAppBarState extends State<CustomAppBar> {
  late final ThemeStore _themeStore;

  @override
  void initState() {
    _themeStore = getIt<ThemeStore>();
    super.initState();
  }

  final HomeController controller = getIt<HomeController>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: AppBar(
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
        flexibleSpace: Container(
          margin: EdgeInsets.only(top: 60.scale),
          height: 50.scale,
          alignment: Alignment.topCenter,
          child: SizedBox(
            height: 40.scale,
            width: size.width * 0.9.scale,
            child: PhysicalModel(
              color: Colors.transparent,
              elevation: 5.0.scale,
              borderRadius: BorderRadius.circular(10),
              shadowColor: Colors.black45,
              child: TextField(
                onChanged: controller.setSearchText,
                style: TextStyle(
                  fontFamily: RMGFonts.roboto,
                  fontSize: 15.scale,
                ),
                // onChanged: widget.controller.setSearch,
                decoration: inputBoxDecoration(theme),
              ),
            ),
          ),
        ),
        bottom: TabBar(
          // ignore: prefer_const_literals_to_create_immutables
          tabs: [
            const Tab(
              text: 'Characters',
            ),
            const Tab(
              text: 'Favorites',
            )
          ],
          indicatorColor: theme.primaryColorLight,
          labelStyle: theme.textTheme.subtitle2,
        ),
        elevation: 0,
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
      ),
    );
  }

  InputDecoration inputBoxDecoration(ThemeData theme) {
    return InputDecoration(
      hintText: 'Search',
      suffixIcon: Icon(
        RMGIcons.search,
        color: RMGColorsLight().secundary,
      ),
    );
  }
}
