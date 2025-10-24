import '../../domain/entities/package_availability.dart';

class PackageAvailabilityModel extends PackageAvailability {
  const PackageAvailabilityModel({
    required super.startDate,
    required super.endDate,
    super.available = true,
  });

  factory PackageAvailabilityModel.fromMap(Map<String, dynamic> map) {
    return PackageAvailabilityModel(
      startDate: DateTime.parse(map['startDate']),
      endDate: DateTime.parse(map['endDate']),
      available: map['available'] ?? true,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'available': available,
    };
  }
}
