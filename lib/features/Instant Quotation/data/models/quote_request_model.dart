import '../../domain/entities/quote_request.dart';
import 'selected_addon_model.dart';

class QuoteRequestModel extends QuoteRequest {
  const QuoteRequestModel({
    required super.packageId,
    required super.guestCount,
    super.selectedAddons = const [],
    super.serviceChargePercent = 0.0,
    super.taxPercent = 0.0,
    super.deliveryFee = 0.0,
    super.discountCodes = const [],
  });

  factory QuoteRequestModel.fromMap(Map<String, dynamic> map) {
    return QuoteRequestModel(
      packageId: map['packageId'],
      guestCount: map['guestCount'],
      selectedAddons: (map['selectedAddons'] as List<dynamic>?)
              ?.map((e) => SelectedAddonModel.fromMap(e))
              .toList() ??
          [],
      serviceChargePercent:
          (map['serviceChargePercent'] as num?)?.toDouble() ?? 0.0,
      taxPercent: (map['taxPercent'] as num?)?.toDouble() ?? 0.0,
      deliveryFee: (map['deliveryFee'] as num?)?.toDouble() ?? 0.0,
      discountCodes:
          (map['discountCodes'] as List<dynamic>?)?.cast<String>() ?? [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'packageId': packageId,
      'guestCount': guestCount,
      'selectedAddons':
          selectedAddons.map((addon) => (addon as SelectedAddonModel).toMap()).toList(),
      'serviceChargePercent': serviceChargePercent,
      'taxPercent': taxPercent,
      'deliveryFee': deliveryFee,
      'discountCodes': discountCodes,
    };
  }
}
