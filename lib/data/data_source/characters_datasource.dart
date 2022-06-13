import 'package:dio/dio.dart';
import 'package:flutter_marvel/data/api_utils.dart';
import 'package:flutter_marvel/data/models/comic_model.dart';

import '../models/characters_model.dart';
import '../models/data_model.dart';

class CharactersDataSource {
  final Dio _dio = Dio();

  // final String ts = '1';
  // final String apikey = 'd59d5f5f62cb81a00ca27ec5415e4bc1';
  // final String hash = 'fe5013dd41814a29ec52c162bd925464';

  final Map<String, dynamic> queryParameters = {
    'ts': 1,
    'apikey': 'd59d5f5f62cb81a00ca27ec5415e4bc1',
    'hash': 'fe5013dd41814a29ec52c162bd925464',
  };

  Future<DataModel<CharactersModel>> getCharacters(int page) async {
    try {
      final _query = queryParameters
        ..addAll({
          'offset': page,
        });

      final response = await _dio.get(
        ApiUtils.characters,
        queryParameters: _query,
      );
      final List _resultList = response.data['data']["results"] as List;
      var _data = DataModel.fromMap(response.data['data']);

      List<CharactersModel> _resultCharacters = List<CharactersModel>.from(
          _resultList.map((e) => CharactersModel.fromMap(e)).toList());

      return DataModel(
        count: _data.count,
        limit: _data.limit,
        offset: _data.offset,
        total: _data.total,
        results: _resultCharacters,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<DataModel<ComicModel>> getComics(int page) async {
    try {
      final _query = queryParameters
        ..addAll({
          'offset': page,
        });

      final response = await _dio.get(
        ApiUtils.comics,
        queryParameters: _query,
      );
      final List _resultList = response.data['data']["results"] as List;
      var _data = DataModel.fromMap(response.data['data']);

      List<ComicModel> _resultComic = List<ComicModel>.from(
          _resultList.map((e) => ComicModel.fromMap(e)).toList());

      return DataModel(
        count: _data.count,
        limit: _data.limit,
        offset: _data.offset,
        total: _data.total,
        results: _resultComic,
      );
    } catch (e) {
      rethrow;
    }
  }
}
