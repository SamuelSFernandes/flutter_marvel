import 'package:flutter_marvel/data/data_source/characters_datasource.dart';
import 'package:flutter_marvel/data/models/characters_model.dart';
import 'package:flutter_marvel/data/models/comic_model.dart';
import 'package:flutter_marvel/data/models/data_model.dart';
import 'package:flutter_marvel/data/repositories/characters_repository.dart';
import 'package:flutter_marvel/infra/failure/failure.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CharactersDataSource _dataSource;
  late CharactersReporitory _repository;

  setUp(() {
    _dataSource = CharactersDataSource();
    _repository = CharactersReporitory(dataSource: _dataSource);
  });

  group('Characters repository test', () {
    test('getCharacters return DataModel<List<CharactersModel>>', () async {
      final _response = await _repository.getCharacters(page: 1);
      final _result = _response.fold((l) => l, (r) => r);

      expect(_result, isA<DataModel<CharactersModel>>());
    });

    test('getCharacters return Failure', () async {
      final _response = await _repository.getCharacters(page: -1);
      final _result = _response.fold((l) => l, (r) => r);

      expect(_result, isA<Failure>());
    });
  });

  group('Comic repository test', () {
    test('getComics return DataModel<List<ComicModel>>', () async {
      final _response = await _repository.getComics(page: 1);
      final _result = _response.fold((l) => l, (r) => r);

      expect(_result, isA<DataModel<ComicModel>>());
    });

    test('getComics return Failure', () async {
      final _response = await _repository.getComics(page: -1);
      final _result = _response.fold((l) => l, (r) => r);

      expect(_result, isA<Failure>());
    });
  });
}
