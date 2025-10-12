import 'package:equatable/equatable.dart';
import 'selected_addon.dart';

class QuoteRequest extends Equatable {
  final String packageId;
  final int guestCount;
  final List<SelectedAddon> selectedAddons;
  final double serviceChargePercent; // e.g., 0.1 for 10%
  final double taxPercent; // e.g., 0.12 for 12%
  final double deliveryFee;
  final List<String> discountCodes;

  const QuoteRequest({
    required this.packageId,
    required this.guestCount,
    this.selectedAddons = const [],
    this.serviceChargePercent = 0.0,
    this.taxPercent = 0.0,
    this.deliveryFee = 0.0,
    this.discountCodes = const [],
  });

  @override
  List<Object?> get props => [packageId, guestCount, selectedAddons, serviceChargePercent, taxPercent, deliveryFee, discountCodes];
}
