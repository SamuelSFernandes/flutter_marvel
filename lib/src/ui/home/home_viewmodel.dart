import 'package:flutter/material.dart';
import 'package:flutter_marvel/data/data_source/characters_datasource.dart';
import 'package:flutter_marvel/data/models/characters_model.dart';
import 'package:mobx/mobx.dart';

import '../../../data/models/data_model.dart';
import '../../../data/repositories/characters_repository.dart';

part 'home_viewmodel.g.dart';

class HomeViewModel = HomeViewModelBase with _$HomeViewModel;

abstract class HomeViewModelBase with Store {
  late final CharactersDataSource _dataSource;
  late CharactersReporitory _repository;

  int _page = 0;

  @observable
  bool isLoadingAllItens = false;

  @observable
  bool isLoadingNewItens = false;

  final scrollController = ScrollController();

  @action
  Future<void> initialize() async {
    isLoadingAllItens = true;

    _dataSource = CharactersDataSource();
    _repository = CharactersReporitory(dataSource: _dataSource);
    await getAllCharacters();
    scrollController.addListener(infinityScroll);

    isLoadingAllItens = false;
  }

  @observable
  DataModel? infoCharacters;

  @observable
  ObservableList<CharactersModel> characters = ObservableList();

  @action
  Future<void> getAllCharacters() async {
    isLoadingNewItens = true;

    final _response = await _repository.getCharacters(page: _page);
    if (_response.isRight()) {
      infoCharacters = _response.fold((l) => null, (r) => r);
      characters.addAll(infoCharacters!.results as List<CharactersModel>);
      _page = _page + 20;
    }
    isLoadingNewItens = false;
  }

  @action
  void infinityScroll() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (infoCharacters!.total > characters.length) {
        getAllCharacters();
      }
    }
  }
}
