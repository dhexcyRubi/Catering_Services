import 'package:equatable/equatable.dart';

class SelectedAddon extends Equatable {
  final String addonId;
  final int quantity;
  final double? pricePerHead;
  final double? fixedPrice;

  const SelectedAddon({
    required this.addonId,
    this.quantity = 1,
    this.pricePerHead,
    this.fixedPrice,
  });

  @override
  List<Object?> get props => [addonId, quantity, pricePerHead, fixedPrice];
}
