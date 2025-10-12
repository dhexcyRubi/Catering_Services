enum BookingStatus { pending, confirmed, declined, cancelled }

extension BookingStatusX on BookingStatus {
  String get name {
    switch (this) {
      case BookingStatus.pending:
        return 'PENDING';
      case BookingStatus.confirmed:
        return 'CONFIRMED';
      case BookingStatus.declined:
        return 'DECLINED';
      case BookingStatus.cancelled:
        return 'CANCELLED';
    }
  }
}
