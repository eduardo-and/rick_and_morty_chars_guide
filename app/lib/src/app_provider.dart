import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'core/network/dio_config.dart';
import 'core/theme/store/theme_store.dart';
import 'modules/home/data/characters_repository.dart';
import 'modules/home/data/datasources/characters_data_source.dart';
import 'modules/home/domain/repositories/i_characters_repository.dart';
import 'modules/home/domain/usecases/get_characters_usecase.dart';
import 'modules/home/presentation/controller/home_controller.dart';

final getIt = GetIt.instance;

Future<void> appSetupProvider() async {
  Dio dio = Dio();
  DioConfig(dio: dio).init();

  final themeStore = ThemeStore();
  await themeStore.init();

  // Core

  getIt.registerSingleton<Dio>(dio);
  getIt.registerSingleton<ThemeStore>(themeStore);


}
