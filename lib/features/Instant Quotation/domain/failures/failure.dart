import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class QuoteCalculationFailure extends Failure {
  const QuoteCalculationFailure([String message = 'Quote calculation failed']) : super(message);
}
