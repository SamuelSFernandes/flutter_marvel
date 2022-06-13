import 'package:dartz/dartz.dart';
import 'package:flutter_marvel/data/models/comic_model.dart';
import 'package:flutter_marvel/data/models/data_model.dart';

import '../../infra/failure/failure.dart';
import '../data_source/characters_datasource.dart';
import '../models/characters_model.dart';

class CharactersReporitory {
  final CharactersDataSource _dataSource;
  CharactersReporitory({
    required CharactersDataSource dataSource,
  }) : _dataSource = dataSource;

  Future<Either<Failure, DataModel<CharactersModel>>> getCharacters(
      {required int page}) async {
    try {
      final _response = await _dataSource.getCharacters(page);
      return right(_response);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, DataModel<ComicModel>>> getComics(
      {required int page}) async {
    try {
      final _response = await _dataSource.getComics(page);
      return right(_response);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
