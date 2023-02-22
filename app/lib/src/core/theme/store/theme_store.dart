import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../data/data_source/shared_preference_data_source.dart';
import '../../utils/extensions/theme_data_extension.dart';

part 'theme_store.g.dart';

class ThemeStore = _ThemeStoreBase with _$ThemeStore;

abstract class _ThemeStoreBase with Store {
  final SharedPreferenceDataSource _localDataBase =
      SharedPreferenceDataSource();

  @observable
  ThemeMode _themeMode = ThemeMode.light;

  @observable
  Offset offset = const Offset(0, 0);

  @action
  Future<void> toggleThemeMode() async {
    _themeMode.isDark
        ? _themeMode = ThemeMode.light
        : _themeMode = ThemeMode.dark;

    await _saveThemeMode(_themeMode);
  }

  @action
  void setOffset(Offset value) => offset = value;

  @computed
  ThemeMode get themeMode => _themeMode;

  Future<void> init() async {
    await _localDataBase.init();
    _themeMode = _readThemeMode();
  }

  ThemeMode _readThemeMode() {
    bool? isDark = _localDataBase.getThemePreference(
      key: 'theme_mode',
    );

    if (isDark != null) {
      return isDark ? ThemeMode.dark : ThemeMode.light;
    }
    return ThemeMode.light;
  }

  @action
  Future<bool> _saveThemeMode(ThemeMode value) async {
    try {
      await _localDataBase.addThemePreference(
        key: 'theme_mode',
        value: value.isDark,
      );

      return true;
    } catch (e) {
      return false;
    }
  }
}
