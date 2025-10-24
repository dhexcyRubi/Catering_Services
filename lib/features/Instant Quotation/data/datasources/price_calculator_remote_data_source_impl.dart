import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/quote_request_model.dart';
import '../models/quote_result_model.dart';
import 'price_calculator_remote_data_source.dart';

class PriceCalculatorRemoteDataSourceImpl
    implements PriceCalculatorRemoteDataSource {
  final FirebaseFirestore firestore;

  PriceCalculatorRemoteDataSourceImpl(this.firestore);

  @override
  Future<QuoteResultModel> calculateQuote(QuoteRequestModel request) async {
    // Fetch package data
    final packageDoc =
        await firestore.collection('packages').doc(request.packageId).get();

    if (!packageDoc.exists) {
      throw Exception('Package not found');
    }

    final packageData = packageDoc.data()!;
    final basePrice = (packageData['pricePerHead'] as num).toDouble();

    // Compute addons total
    double addonsTotal = 0;
    for (var addon in request.selectedAddons) {
      final addonData =
          await firestore.collection('addons').doc(addon.addonId).get();
      if (addonData.exists) {
        final pricePerHead = addon.pricePerHead ??
            (addonData['pricePerHead'] as num?)?.toDouble() ??
            0;
        final fixedPrice =
            addon.fixedPrice ?? (addonData['fixedPrice'] as num?)?.toDouble() ?? 0;

        addonsTotal +=
            (pricePerHead * request.guestCount) + (fixedPrice * addon.quantity);
      }
    }

    final baseTotal = basePrice * request.guestCount;
    final serviceCharge = baseTotal * request.serviceChargePercent;
    final tax = baseTotal * request.taxPercent;
    const discounts = 0.0; // Discount handling to be added later
    final deliveryFee = request.deliveryFee;

    final total =
        baseTotal + addonsTotal + serviceCharge + tax + deliveryFee - discounts;

    final breakdown = PriceBreakdownModel(
      basePrice: baseTotal,
      addonsTotal: addonsTotal,
      serviceCharge: serviceCharge,
      tax: tax,
      discounts: discounts,
      deliveryFee: deliveryFee,
      total: total,
    );

    return QuoteResultModel(
      packageId: request.packageId,
      guestCount: request.guestCount,
      breakdown: breakdown,
      perHead: total / request.guestCount,
    );
  }
}
