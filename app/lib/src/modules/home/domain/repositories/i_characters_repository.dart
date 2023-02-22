import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_guide/src/core/domain/entities/character_entity.dart';

abstract class ICharactersRepository {
  Future<Either<Exception, List<Character>>> getCharacters({int page});
}
