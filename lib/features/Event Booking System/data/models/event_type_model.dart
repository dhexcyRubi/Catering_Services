import '../../domain/entities/event_type.dart';

class EventTypeModel extends EventType {
  const EventTypeModel({required super.id, required super.name});

  factory EventTypeModel.fromJson(Map<String, dynamic> json) {
    return EventTypeModel(
      id: json['id'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
