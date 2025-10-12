import 'package:equatable/equatable.dart';
import 'package_availability.dart';
import 'package_image.dart';

class Package extends Equatable {
  final String id;
  final String name;
  final String? description;
  final double? pricePerHead; // nullable if fixedPrice used
  final double? fixedPrice;
  final String servingStyle; // e.g., 'buffet', 'plated', 'tray'
  final int? minGuests;
  final int? maxGuests;
  final List<String> includedDishes; // simple list of dish names
  final List<String> addonIds; // references to Addon ids
  final List<PackageImage> images;
  final List<PackageAvailability> availability;
  final bool isDraft;
  final bool isPublished;
  final DateTime createdAt;

  Package({
    required this.id,
    required this.name,
    this.description,
    this.pricePerHead,
    this.fixedPrice,
    this.servingStyle = 'buffet',
    this.minGuests,
    this.maxGuests,
    this.includedDishes = const [],
    this.addonIds = const [],
    this.images = const [],
    this.availability = const [],
    this.isDraft = true,
    this.isPublished = false,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  Package copyWith({
    String? id,
    String? name,
    String? description,
    double? pricePerHead,
    double? fixedPrice,
    String? servingStyle,
    int? minGuests,
    int? maxGuests,
    List<String>? includedDishes,
    List<String>? addonIds,
    List<PackageImage>? images,
    List<PackageAvailability>? availability,
    bool? isDraft,
    bool? isPublished,
    DateTime? createdAt,
  }) {
    return Package(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      pricePerHead: pricePerHead ?? this.pricePerHead,
      fixedPrice: fixedPrice ?? this.fixedPrice,
      servingStyle: servingStyle ?? this.servingStyle,
      minGuests: minGuests ?? this.minGuests,
      maxGuests: maxGuests ?? this.maxGuests,
      includedDishes: includedDishes ?? this.includedDishes,
      addonIds: addonIds ?? this.addonIds,
      images: images ?? this.images,
      availability: availability ?? this.availability,
      isDraft: isDraft ?? this.isDraft,
      isPublished: isPublished ?? this.isPublished,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        pricePerHead,
        fixedPrice,
        servingStyle,
        minGuests,
        maxGuests,
        includedDishes,
        addonIds,
        images,
        availability,
        isDraft,
        isPublished,
        createdAt,
      ];
}
