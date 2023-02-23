import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'core/network/dio_config.dart';
import 'core/theme/store/theme_store.dart';

final getIt = GetIt.instance;

Future<void> appSetupProvider() async {
  Dio dio = DioConfig().dio;

  final themeStore = ThemeStore();
  await themeStore.init();

  // Core
  getIt.registerSingleton<Dio>(dio);
  getIt.registerSingleton<ThemeStore>(themeStore);
}
