import 'package:dartz/dartz.dart';

import '../../../../core/domain/entities/character_entity.dart';

abstract class ICharactersRepository {
  Future<Either<Exception, List<Character>>> getCharacters({int page});
}
