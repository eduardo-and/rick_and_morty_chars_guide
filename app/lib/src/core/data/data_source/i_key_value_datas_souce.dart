abstract class IKeyValueDataSource {
  Future<void> addThemePreference({required String key,required  bool value});
  bool? getThemePreference({required  String key});
  Future<void> removeThemePreference({required String key});
}
