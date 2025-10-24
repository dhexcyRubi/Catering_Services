import '../models/quote_request_model.dart';
import '../models/quote_result_model.dart';

abstract class PriceCalculatorRemoteDataSource {
  Future<QuoteResultModel> calculateQuote(QuoteRequestModel request);
}
