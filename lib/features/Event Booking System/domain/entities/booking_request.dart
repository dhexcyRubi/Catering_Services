import 'package:equatable/equatable.dart';
import 'booking_status.dart';
import 'event_type.dart';
import 'addon.dart';
import 'price_breakdown.dart';

class BookingRequest extends Equatable {
  final String id;
  final String clientId;
  final String packageId;
  final EventType eventType;
  final DateTime eventDateTime;
  final String timezone;
  final String location;
  final int guestCount;
  final List<Addon> selectedAddons;
  final String? notes;
  final BookingStatus status;
  final PriceBreakdown price;
  final DateTime createdAt;

  BookingRequest({
    required this.id,
    required this.clientId,
    required this.packageId,
    required this.eventType,
    required this.eventDateTime,
    required this.timezone,
    required this.location,
    required this.guestCount,
    this.selectedAddons = const [],
    this.notes,
    this.status = BookingStatus.pending,
    required this.price,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  BookingRequest copyWith({
    String? id,
    String? clientId,
    String? packageId,
    EventType? eventType,
    DateTime? eventDateTime,
    String? timezone,
    String? location,
    int? guestCount,
    List<Addon>? selectedAddons,
    String? notes,
    BookingStatus? status,
    PriceBreakdown? price,
    DateTime? createdAt,
  }) {
    return BookingRequest(
      id: id ?? this.id,
      clientId: clientId ?? this.clientId,
      packageId: packageId ?? this.packageId,
      eventType: eventType ?? this.eventType,
      eventDateTime: eventDateTime ?? this.eventDateTime,
      timezone: timezone ?? this.timezone,
      location: location ?? this.location,
      guestCount: guestCount ?? this.guestCount,
      selectedAddons: selectedAddons ?? this.selectedAddons,
      notes: notes ?? this.notes,
      status: status ?? this.status,
      price: price ?? this.price,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props => [id, clientId, packageId, eventType, eventDateTime, timezone, location, guestCount, selectedAddons, notes, status, price, createdAt];
}
