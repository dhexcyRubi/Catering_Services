import 'package:equatable/equatable.dart';

class PriceBreakdown {
  // Add fields and methods as needed
  const PriceBreakdown();
}

class QuoteResult extends Equatable {
  final String packageId;
  final int guestCount;
  final PriceBreakdown breakdown;
  final double perHead;

  const QuoteResult({
    required this.packageId,
    required this.guestCount,
    required this.breakdown,
    required this.perHead,
  });

  @override
  List<Object?> get props => [packageId, guestCount, breakdown, perHead];
}
