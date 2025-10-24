import '../../domain/entities/booking_action.dart';
import '../../../Event Booking System/domain/entities/booking_status.dart';

class BookingActionModel extends BookingAction {
  BookingActionModel({
    required super.performedById,
    required super.fromStatus,
    required super.toStatus,
    super.comment,
    super.performedAt,
  });

  factory BookingActionModel.fromJson(Map<String, dynamic> json) {
    return BookingActionModel(
      performedById: json['performedById'],
      fromStatus: BookingStatus.values.firstWhere(
          (e) => e.name == json['fromStatus'],
          orElse: () => BookingStatus.pending),
      toStatus: BookingStatus.values.firstWhere(
          (e) => e.name == json['toStatus'],
          orElse: () => BookingStatus.pending),
      comment: json['comment'],
      performedAt: DateTime.parse(json['performedAt']),
    );
  }

  Map<String, dynamic> toJson() => {
        'performedById': performedById,
        'fromStatus': fromStatus.name,
        'toStatus': toStatus.name,
        'comment': comment,
        'performedAt': performedAt.toIso8601String(),
      };
}
