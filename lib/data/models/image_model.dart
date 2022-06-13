class ImagesModel {
  String path;
  String extension;
  ImagesModel({
    required this.path,
    required this.extension,
  });

  String get imageUrl => '$path.$extension';

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'path': path});
    result.addAll({'extension': extension});

    return result;
  }

  factory ImagesModel.fromMap(Map<String, dynamic> map) {
    return ImagesModel(
      path: map['path'] ?? '',
      extension: map['extension'] ?? '',
    );
  }
}
