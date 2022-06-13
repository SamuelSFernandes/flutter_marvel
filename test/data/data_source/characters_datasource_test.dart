import 'package:flutter_marvel/data/data_source/characters_datasource.dart';
import 'package:flutter_marvel/data/models/characters_model.dart';
import 'package:flutter_marvel/data/models/comic_model.dart';
import 'package:flutter_marvel/data/models/data_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CharactersDataSource _dataSource;

  setUp(() {
    _dataSource = CharactersDataSource();
  });

  group('Characters Data Source test', () {
    test(
        'When try get Characters then return a right DataModel<CharactersModel>',
        () async {
      final _response = await _dataSource.getCharacters(1);
      expect(_response, isA<DataModel<CharactersModel>>());
    });
  });

  group('Comics Data Source test', () {
    test('When try get Comics then return a right DataModel<ComicModel>',
        () async {
      final _response = await _dataSource.getComics(1);
      expect(_response, isA<DataModel<ComicModel>>());
    });
  });
}
