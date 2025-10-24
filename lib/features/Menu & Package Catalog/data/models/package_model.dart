import '../../domain/entities/package.dart';
import 'package_image_model.dart';
import 'package_availability_model.dart';

class PackageModel extends Package {
  PackageModel({
    required super.id,
    required super.name,
    super.description,
    super.pricePerHead,
    super.fixedPrice,
    super.servingStyle = 'buffet',
    super.minGuests,
    super.maxGuests,
    super.includedDishes = const [],
    super.addonIds = const [],
    super.images = const [],
    super.availability = const [],
    super.isDraft = true,
    super.isPublished = false,
    super.createdAt,
  });

  factory PackageModel.fromMap(Map<String, dynamic> map) {
    return PackageModel(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      pricePerHead: (map['pricePerHead'] as num?)?.toDouble(),
      fixedPrice: (map['fixedPrice'] as num?)?.toDouble(),
      servingStyle: map['servingStyle'] ?? 'buffet',
      minGuests: map['minGuests'],
      maxGuests: map['maxGuests'],
      includedDishes: List<String>.from(map['includedDishes'] ?? []),
      addonIds: List<String>.from(map['addonIds'] ?? []),
      images: (map['images'] as List<dynamic>?)
              ?.map((e) => PackageImageModel.fromMap(e))
              .toList() ??
          [],
      availability: (map['availability'] as List<dynamic>?)
              ?.map((e) => PackageAvailabilityModel.fromMap(e))
              .toList() ??
          [],
      isDraft: map['isDraft'] ?? true,
      isPublished: map['isPublished'] ?? false,
      createdAt: map['createdAt'] != null
          ? DateTime.parse(map['createdAt'])
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'pricePerHead': pricePerHead,
      'fixedPrice': fixedPrice,
      'servingStyle': servingStyle,
      'minGuests': minGuests,
      'maxGuests': maxGuests,
      'includedDishes': includedDishes,
      'addonIds': addonIds,
      'images': images.map((e) => (e as PackageImageModel).toMap()).toList(),
      'availability':
          availability.map((e) => (e as PackageAvailabilityModel).toMap()).toList(),
      'isDraft': isDraft,
      'isPublished': isPublished,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
