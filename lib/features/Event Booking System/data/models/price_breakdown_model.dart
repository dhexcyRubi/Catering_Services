import '../../domain/entities/price_breakdown.dart';

class PriceBreakdownModel extends PriceBreakdown {
  const PriceBreakdownModel({
    required super.baseCost,
    required super.addonsTotal,
    required super.serviceCharge,
    required super.tax,
    required super.deliveryFee,
    required super.subtotal,
    required super.total,
  });

  factory PriceBreakdownModel.fromJson(Map<String, dynamic> json) {
    return PriceBreakdownModel(
      baseCost: (json['baseCost'] as num).toDouble(),
      addonsTotal: (json['addonsTotal'] as num).toDouble(),
      serviceCharge: (json['serviceCharge'] as num).toDouble(),
      tax: (json['tax'] as num).toDouble(),
      deliveryFee: (json['deliveryFee'] as num).toDouble(),
      subtotal: (json['subtotal'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'baseCost': baseCost,
        'addonsTotal': addonsTotal,
        'serviceCharge': serviceCharge,
        'tax': tax,
        'deliveryFee': deliveryFee,
        'subtotal': subtotal,
        'total': total,
      };
}
