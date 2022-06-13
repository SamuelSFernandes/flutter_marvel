import 'dart:convert';

import 'image_model.dart';

class ComicModel {
  int id;
  int digitalId;
  String title;
  int issueNumber;
  String variantDescription;
  String description;
  String modified;
  int pageCount;
  ImagesModel thumbnail;
  List<ImagesModel> images;
  ComicModel({
    required this.id,
    required this.digitalId,
    required this.title,
    required this.issueNumber,
    required this.variantDescription,
    required this.description,
    required this.modified,
    required this.pageCount,
    required this.thumbnail,
    required this.images,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'digitalId': digitalId});
    result.addAll({'title': title});
    result.addAll({'issueNumber': issueNumber});
    result.addAll({'variantDescription': variantDescription});
    result.addAll({'description': description});
    result.addAll({'modified': modified});
    result.addAll({'pageCount': pageCount});
    result.addAll({'thumbnail': thumbnail.toMap()});
    result.addAll({'images': images.map((x) => x.toMap()).toList()});

    return result;
  }

  factory ComicModel.fromMap(Map<String, dynamic> map) {
    return ComicModel(
      id: map['id']?.toInt() ?? 0,
      digitalId: map['digitalId']?.toInt() ?? 0,
      title: map['title'] ?? '',
      issueNumber: map['issueNumber']?.toInt() ?? 0,
      variantDescription: map['variantDescription'] ?? '',
      description: map['description'] ?? '',
      modified: map['modified'] ?? '',
      pageCount: map['pageCount']?.toInt() ?? 0,
      thumbnail: ImagesModel.fromMap(map['thumbnail']),
      images: List<ImagesModel>.from(
          map['images']?.map((x) => ImagesModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ComicModel.fromJson(String source) =>
      ComicModel.fromMap(json.decode(source));
}
