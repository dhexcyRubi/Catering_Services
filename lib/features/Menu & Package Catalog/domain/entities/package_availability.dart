import 'package:equatable/equatable.dart';

class PackageAvailability extends Equatable {
  final DateTime startDate;
  final DateTime endDate;
  final bool available; // true = available, false = blackout

  const PackageAvailability({required this.startDate, required this.endDate, this.available = true});

  @override
  List<Object?> get props => [startDate, endDate, available];
}
