import '../../domain/entities/selected_addon.dart';

class SelectedAddonModel extends SelectedAddon {
  const SelectedAddonModel({
    required super.addonId,
    super.quantity = 1,
    super.pricePerHead,
    super.fixedPrice,
  });

  factory SelectedAddonModel.fromMap(Map<String, dynamic> map) {
    return SelectedAddonModel(
      addonId: map['addonId'],
      quantity: map['quantity'] ?? 1,
      pricePerHead: (map['pricePerHead'] as num?)?.toDouble(),
      fixedPrice: (map['fixedPrice'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'addonId': addonId,
      'quantity': quantity,
      'pricePerHead': pricePerHead,
      'fixedPrice': fixedPrice,
    };
  }
}
