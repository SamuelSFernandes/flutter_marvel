// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DetailsViewModel on DetailsViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'DetailsViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$characterAtom =
      Atom(name: 'DetailsViewModelBase.character', context: context);

  @override
  CharactersModel? get character {
    _$characterAtom.reportRead();
    return super.character;
  }

  @override
  set character(CharactersModel? value) {
    _$characterAtom.reportWrite(value, super.character, () {
      super.character = value;
    });
  }

  late final _$comicsAtom =
      Atom(name: 'DetailsViewModelBase.comics', context: context);

  @override
  ObservableList<ComicModel> get comics {
    _$comicsAtom.reportRead();
    return super.comics;
  }

  @override
  set comics(ObservableList<ComicModel> value) {
    _$comicsAtom.reportWrite(value, super.comics, () {
      super.comics = value;
    });
  }

  late final _$getAllComicsAsyncAction =
      AsyncAction('DetailsViewModelBase.getAllComics', context: context);

  @override
  Future<void> getAllComics() {
    return _$getAllComicsAsyncAction.run(() => super.getAllComics());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
character: ${character},
comics: ${comics}
    ''';
  }
}
