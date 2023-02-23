
import '../../app_provider.dart';
import 'data/characters_repository.dart';
import 'data/datasources/characters_data_source.dart';
import 'domain/repositories/i_characters_repository.dart';
import 'domain/usecases/get_characters_usecase.dart';
import 'presentation/controller/home_controller.dart';

homeProvider() {
  getIt.registerSingleton<CharactersDataSource>(CharactersDataSource());

  getIt.registerSingleton<ICharactersRepository>(CharactersRepository());

  getIt.registerSingleton<GetCharactersUsecase>(GetCharactersUsecase());

  getIt.registerSingleton<HomeController>(HomeController());
}
