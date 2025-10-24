import '../../domain/entities/addon.dart';

class AddonModel extends Addon {
  const AddonModel({
    required super.id,
    required super.name,
    required super.price,
    super.description,
  });

  factory AddonModel.fromJson(Map<String, dynamic> json) {
    return AddonModel(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'description': description,
      };
}
