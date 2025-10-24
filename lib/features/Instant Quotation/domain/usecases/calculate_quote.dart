import 'package:dartz/dartz.dart';
import '../repositories/price_calculator_repository.dart';
import '../entities/quote_request.dart';
import '../entities/quote_result.dart';
import '../../../../core/error/failure.dart';

class CalculateQuote {
  final PriceCalculatorRepository repository;
  CalculateQuote(this.repository);

  Future<Either<Failure, QuoteResult>> call(QuoteRequest request) {
    return repository.calculateQuote(request);
  }
}
