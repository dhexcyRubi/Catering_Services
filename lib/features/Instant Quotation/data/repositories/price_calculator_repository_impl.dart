import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/quote_request.dart';
import '../../domain/entities/quote_result.dart';
import '../../domain/repositories/price_calculator_repository.dart';
import '../datasources/price_calculator_remote_data_source.dart';
import '../models/quote_request_model.dart';

class PriceCalculatorRepositoryImpl implements PriceCalculatorRepository {
  final PriceCalculatorRemoteDataSource remoteDataSource;

  PriceCalculatorRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, QuoteResult>> calculateQuote(QuoteRequest request) async {
    try {
      final requestModel = QuoteRequestModel(
        packageId: request.packageId,
        guestCount: request.guestCount,
        selectedAddons: request.selectedAddons,
        serviceChargePercent: request.serviceChargePercent,
        taxPercent: request.taxPercent,
        deliveryFee: request.deliveryFee,
        discountCodes: request.discountCodes,
      );

      final result = await remoteDataSource.calculateQuote(requestModel);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
