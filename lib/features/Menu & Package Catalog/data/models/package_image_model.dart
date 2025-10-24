import '../../domain/entities/package_image.dart';

class PackageImageModel extends PackageImage {
  const PackageImageModel({
    required super.id,
    required super.url,
    super.altText,
  });

  factory PackageImageModel.fromMap(Map<String, dynamic> map) {
    return PackageImageModel(
      id: map['id'],
      url: map['url'],
      altText: map['altText'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'url': url,
      'altText': altText,
    };
  }
}
