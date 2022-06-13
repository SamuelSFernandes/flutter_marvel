// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on HomeViewModelBase, Store {
  late final _$isLoadingAllItensAtom =
      Atom(name: 'HomeViewModelBase.isLoadingAllItens', context: context);

  @override
  bool get isLoadingAllItens {
    _$isLoadingAllItensAtom.reportRead();
    return super.isLoadingAllItens;
  }

  @override
  set isLoadingAllItens(bool value) {
    _$isLoadingAllItensAtom.reportWrite(value, super.isLoadingAllItens, () {
      super.isLoadingAllItens = value;
    });
  }

  late final _$isLoadingNewItensAtom =
      Atom(name: 'HomeViewModelBase.isLoadingNewItens', context: context);

  @override
  bool get isLoadingNewItens {
    _$isLoadingNewItensAtom.reportRead();
    return super.isLoadingNewItens;
  }

  @override
  set isLoadingNewItens(bool value) {
    _$isLoadingNewItensAtom.reportWrite(value, super.isLoadingNewItens, () {
      super.isLoadingNewItens = value;
    });
  }

  late final _$infoCharactersAtom =
      Atom(name: 'HomeViewModelBase.infoCharacters', context: context);

  @override
  DataModel<dynamic>? get infoCharacters {
    _$infoCharactersAtom.reportRead();
    return super.infoCharacters;
  }

  @override
  set infoCharacters(DataModel<dynamic>? value) {
    _$infoCharactersAtom.reportWrite(value, super.infoCharacters, () {
      super.infoCharacters = value;
    });
  }

  late final _$charactersAtom =
      Atom(name: 'HomeViewModelBase.characters', context: context);

  @override
  ObservableList<CharactersModel> get characters {
    _$charactersAtom.reportRead();
    return super.characters;
  }

  @override
  set characters(ObservableList<CharactersModel> value) {
    _$charactersAtom.reportWrite(value, super.characters, () {
      super.characters = value;
    });
  }

  late final _$initializeAsyncAction =
      AsyncAction('HomeViewModelBase.initialize', context: context);

  @override
  Future<void> initialize() {
    return _$initializeAsyncAction.run(() => super.initialize());
  }

  late final _$getAllCharactersAsyncAction =
      AsyncAction('HomeViewModelBase.getAllCharacters', context: context);

  @override
  Future<void> getAllCharacters() {
    return _$getAllCharactersAsyncAction.run(() => super.getAllCharacters());
  }

  late final _$HomeViewModelBaseActionController =
      ActionController(name: 'HomeViewModelBase', context: context);

  @override
  void infinityScroll() {
    final _$actionInfo = _$HomeViewModelBaseActionController.startAction(
        name: 'HomeViewModelBase.infinityScroll');
    try {
      return super.infinityScroll();
    } finally {
      _$HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoadingAllItens: ${isLoadingAllItens},
isLoadingNewItens: ${isLoadingNewItens},
infoCharacters: ${infoCharacters},
characters: ${characters}
    ''';
  }
}
