import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class DashboardServerFailure extends Failure {
  const DashboardServerFailure([String message = 'Dashboard server failure']) : super(message);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure([String message = 'Not found']) : super(message);
}
