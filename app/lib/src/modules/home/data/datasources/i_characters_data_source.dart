import '../../../../core/data/model/person_model.dart';

abstract class ICharactersDataSource {
  Future<List<CharacterModel>> getCharacters({int page = 0});
}
