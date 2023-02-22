import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'i_key_value_datas_souce.dart';

class SharedPreferenceDataSource implements IKeyValueDataSource {
  late final SharedPreferences _sharedPreferences;

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Future<void> addThemePreference(
      {required String key, required bool value}) async {
    try {
      await _sharedPreferences.setBool(key, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  bool? getThemePreference({required String key}) {
    try {
      return _sharedPreferences.getBool(key);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<void> removeThemePreference({required String key}) async {
    try {
      await _sharedPreferences.remove(key);
    } catch (e) {
     debugPrint(e.toString()); 
    }
  }
}
