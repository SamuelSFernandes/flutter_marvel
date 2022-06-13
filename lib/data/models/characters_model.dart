import 'dart:convert';

import 'image_model.dart';

class CharactersModel {
  final int id;
  final String name;
  final String? description;
  final ImagesModel? thumbnail;
  final InfoComicModel comics;
  final List<UrlsCharactersModel>? urls;
  CharactersModel({
    required this.id,
    required this.name,
    this.description,
    this.thumbnail,
    required this.comics,
    required this.urls,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    if (description != null) {
      result.addAll({'description': description});
    }
    if (thumbnail != null) {
      result.addAll({'thumbnail': thumbnail!.toMap()});
    }
    result.addAll({'comics': comics.toMap()});
    if (urls != null) {
      result.addAll({'urls': urls!.map((x) => x.toMap()).toList()});
    }

    return result;
  }

  factory CharactersModel.fromMap(Map<String, dynamic> map) {
    return CharactersModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      description: map['description'] != null && map['description'].isNotEmpty
          ? map['description']
          : 'No description',
      thumbnail: map['thumbnail'] != null
          ? ImagesModel.fromMap(map['thumbnail'])
          : null,
      comics: InfoComicModel.fromMap(map['comics']),
      urls: map['urls'] != null
          ? List<UrlsCharactersModel>.from(
              map['urls']?.map((x) => UrlsCharactersModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CharactersModel.fromJson(String source) =>
      CharactersModel.fromMap(json.decode(source));
}

class InfoComicModel {
  final int available;
  final String collectionURI;
  final List<ItemComicModel> items;
  InfoComicModel({
    required this.available,
    required this.collectionURI,
    required this.items,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'available': available});
    result.addAll({'collectionURI': collectionURI});
    result.addAll({'items': items.map((x) => x.toMap()).toList()});

    return result;
  }

  factory InfoComicModel.fromMap(Map<String, dynamic> map) {
    return InfoComicModel(
      available: map['available']?.toInt() ?? 0,
      collectionURI: map['collectionURI'] ?? '',
      items: List<ItemComicModel>.from(
          map['items']?.map((x) => ItemComicModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory InfoComicModel.fromJson(String source) =>
      InfoComicModel.fromMap(json.decode(source));
}

class ItemComicModel {
  final String name;
  final String resourceURI;
  ItemComicModel({
    required this.name,
    required this.resourceURI,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'resourceURI': resourceURI});

    return result;
  }

  factory ItemComicModel.fromMap(Map<String, dynamic> map) {
    return ItemComicModel(
      name: map['name'] ?? '',
      resourceURI: map['resourceURI'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemComicModel.fromJson(String source) =>
      ItemComicModel.fromMap(json.decode(source));
}

class UrlsCharactersModel {
  String type;
  String url;
  UrlsCharactersModel({
    required this.type,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'type': type});
    result.addAll({'url': url});

    return result;
  }

  factory UrlsCharactersModel.fromMap(Map<String, dynamic> map) {
    return UrlsCharactersModel(
      type: map['type'] ?? '',
      url: map['url'] ?? '',
    );
  }
}
