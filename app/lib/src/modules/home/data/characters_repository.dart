import 'package:dartz/dartz.dart';
import '../../../app_provider.dart';
import '../../../core/data/model/person_model.dart';
import '../../../core/domain/entities/character_entity.dart';
import 'datasources/characters_data_source.dart';

import '../domain/repositories/i_characters_repository.dart';
import 'datasources/i_characters_data_source.dart';

class CharactersRepository implements ICharactersRepository {
  final ICharactersDataSource _dataSource = getIt<CharactersDataSource>();

  // CharactersRepository({required ICharactersDataSource dataSource})
  //     : _dataSource = dataSource;

  @override
  Future<Either<Exception, List<Character>>> getCharacters(
      {int page = 0}) async {
    try {
      final List<CharacterModel> characters = await _dataSource.getCharacters( page: page);
      return Right(characters.map((char) => char.toEntity()).toList());
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
