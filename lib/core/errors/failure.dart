import 'package:equatable/equatable.dart';

import 'exceptions.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]) : super();
}

class ServerFailure extends Failure {
  final String? message;
  final int? statusCode;

  const ServerFailure({this.message, this.statusCode});

  factory ServerFailure.fromException(ServerException exception) {
    return ServerFailure(
      message: exception.message,
      statusCode: exception.statusCode,
    );
  }

  @override
  List<Object> get props => [];
}

class NoInternetFailure extends Failure {
  @override
  List<Object> get props => [];
}

class AuthorizationFailure extends Failure {
  @override
  List<Object> get props => [];
}

class TimeoutFailure extends Failure {
  @override
  List<Object> get props => [];
}

class SystemAlertFailure extends Failure {
  final String message;
  final dynamic payload;

  const SystemAlertFailure({
    required this.message,
    this.payload,
  });

  factory SystemAlertFailure.fromException(SystemAlertException exception) {
    return SystemAlertFailure(
      message: exception.message,
      payload: exception.payload,
    );
  }

  void show(SystemAlertFailure systemAlertFailure) => show(this);

  @override
  List<Object> get props => [];
}
