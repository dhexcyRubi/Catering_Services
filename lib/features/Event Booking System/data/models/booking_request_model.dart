import '../../domain/entities/booking_request.dart';
import '../../domain/entities/booking_status.dart';
import 'addon_model.dart';
import 'event_type_model.dart';
import 'price_breakdown_model.dart';

class BookingRequestModel extends BookingRequest {
  BookingRequestModel({
    required super.id,
    required super.clientId,
    required super.packageId,
    required super.eventType,
    required super.eventDateTime,
    required super.timezone,
    required super.location,
    required super.guestCount,
    required super.selectedAddons,
    super.notes,
    required super.status,
    required super.price,
    required super.createdAt,
  });

  factory BookingRequestModel.fromJson(Map<String, dynamic> json) {
    return BookingRequestModel(
      id: json['id'] as String,
      clientId: json['clientId'] as String,
      packageId: json['packageId'] as String,
      eventType: EventTypeModel.fromJson(json['eventType']),
      eventDateTime: DateTime.parse(json['eventDateTime']),
      timezone: json['timezone'] as String,
      location: json['location'] as String,
      guestCount: json['guestCount'] as int,
      selectedAddons: (json['selectedAddons'] as List<dynamic>)
          .map((e) => AddonModel.fromJson(e))
          .toList(),
      notes: json['notes'],
      status: BookingStatus.values.firstWhere(
        (e) => e.name == (json['status'] as String).toUpperCase(),
        orElse: () => BookingStatus.pending,
      ),
      price: PriceBreakdownModel.fromJson(json['price']),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'clientId': clientId,
        'packageId': packageId,
        'eventType': (eventType as EventTypeModel).toJson(),
        'eventDateTime': eventDateTime.toIso8601String(),
        'timezone': timezone,
        'location': location,
        'guestCount': guestCount,
        'selectedAddons': selectedAddons
            .map((addon) => (addon as AddonModel).toJson())
            .toList(),
        'notes': notes,
        'status': status.name,
        'price': (price as PriceBreakdownModel).toJson(),
        'createdAt': createdAt.toIso8601String(),
      };
}
