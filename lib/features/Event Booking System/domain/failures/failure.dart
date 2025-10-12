import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

/// Example concrete failures can live in data layer or a shared failures file:
class ServerFailure extends Failure {
  const ServerFailure([String message = 'Server failure']) : super(message);
}

class AuthFailure extends Failure {
  const AuthFailure([String message = 'Authentication failure']) : super(message);
}