import '../../domain/entities/quote_result.dart';

class PriceBreakdownModel extends PriceBreakdown {
  final double basePrice;
  final double addonsTotal;
  final double serviceCharge;
  final double tax;
  final double discounts;
  final double deliveryFee;
  final double total;

  const PriceBreakdownModel({
    required this.basePrice,
    required this.addonsTotal,
    required this.serviceCharge,
    required this.tax,
    required this.discounts,
    required this.deliveryFee,
    required this.total,
  }) : super();

  factory PriceBreakdownModel.fromMap(Map<String, dynamic> map) {
    return PriceBreakdownModel(
      basePrice: (map['basePrice'] as num).toDouble(),
      addonsTotal: (map['addonsTotal'] as num).toDouble(),
      serviceCharge: (map['serviceCharge'] as num).toDouble(),
      tax: (map['tax'] as num).toDouble(),
      discounts: (map['discounts'] as num).toDouble(),
      deliveryFee: (map['deliveryFee'] as num).toDouble(),
      total: (map['total'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'basePrice': basePrice,
      'addonsTotal': addonsTotal,
      'serviceCharge': serviceCharge,
      'tax': tax,
      'discounts': discounts,
      'deliveryFee': deliveryFee,
      'total': total,
    };
  }
}

class QuoteResultModel extends QuoteResult {
  const QuoteResultModel({
    required super.packageId,
    required super.guestCount,
    required PriceBreakdownModel super.breakdown,
    required super.perHead,
  });

  factory QuoteResultModel.fromMap(Map<String, dynamic> map) {
    return QuoteResultModel(
      packageId: map['packageId'],
      guestCount: map['guestCount'],
      breakdown: PriceBreakdownModel.fromMap(map['breakdown']),
      perHead: (map['perHead'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'packageId': packageId,
      'guestCount': guestCount,
      'breakdown': (breakdown as PriceBreakdownModel).toMap(),
      'perHead': perHead,
    };
  }
}
