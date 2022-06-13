import 'package:flutter_marvel/data/data_source/characters_datasource.dart';
import 'package:flutter_marvel/data/models/comic_model.dart';
import 'package:mobx/mobx.dart';

import '../../../data/models/characters_model.dart';
import '../../../data/models/data_model.dart';
import '../../../data/repositories/characters_repository.dart';

part 'details_viewmodel.g.dart';

class DetailsViewModel = DetailsViewModelBase with _$DetailsViewModel;

abstract class DetailsViewModelBase with Store {
  late final CharactersDataSource _dataSource;
  late CharactersReporitory _repository;

  Future<void> initialize() async {
    _dataSource = CharactersDataSource();
    _repository = CharactersReporitory(dataSource: _dataSource);
    await getAllComics();
  }

  @observable
  bool isLoading = false;

  @observable
  CharactersModel? character;

  @observable
  ObservableList<ComicModel> comics = ObservableList();

  DataModel<ComicModel>? infoCharacters;

  @action
  Future<void> getAllComics() async {
    isLoading = true;

    final _response = await _repository.getComics(page: 0);
    if (_response.isRight()) {
      infoCharacters = _response.fold((l) => null, (r) => r);
      comics.addAll(infoCharacters!.results);
    }

    isLoading = false;
  }
}
