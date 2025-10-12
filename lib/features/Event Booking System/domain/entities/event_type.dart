import 'package:equatable/equatable.dart';

class EventType extends Equatable {
  final String id;
  final String name;

  const EventType({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
