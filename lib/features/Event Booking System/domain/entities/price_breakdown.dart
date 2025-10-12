import 'package:equatable/equatable.dart';

class PriceBreakdown extends Equatable {
  final double baseCost;
  final double addonsTotal;
  final double serviceCharge;
  final double tax;
  final double deliveryFee;
  final double subtotal;
  final double total;

  const PriceBreakdown({
    required this.baseCost,
    required this.addonsTotal,
    required this.serviceCharge,
    required this.tax,
    required this.deliveryFee,
    required this.subtotal,
    required this.total,
  });

  @override
  List<Object?> get props => [baseCost, addonsTotal, serviceCharge, tax, deliveryFee, subtotal, total];
}
