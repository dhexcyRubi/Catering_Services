import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}
class ServerFailure extends Failure {
  final dynamic code;

  const ServerFailure(String message, {this.code}) : super(message);
}
class CacheFailure extends Failure {
  const CacheFailure(String message) : super(message);
}
class ValidationFailure extends Failure {
  const ValidationFailure(String message) : super(message);
}
