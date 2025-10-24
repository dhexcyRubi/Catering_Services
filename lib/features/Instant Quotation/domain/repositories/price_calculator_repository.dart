import 'package:dartz/dartz.dart';
import '../entities/quote_request.dart';
import '../entities/quote_result.dart';
import '../../../../core/error/failure.dart';

abstract class PriceCalculatorRepository {
  Future<Either<Failure, QuoteResult>> calculateQuote(QuoteRequest request);
}
