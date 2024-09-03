import 'failure.dart';

abstract class AppException implements Exception {
  Failure get toFailure;
}

class ServerException implements AppException {
  final String? message;
  final int? statusCode;

  ServerException({this.message, this.statusCode});

  @override
  ServerFailure get toFailure {
    return ServerFailure.fromException(this);
  }
}

class NoInternetException implements AppException {
  @override
  NoInternetFailure get toFailure {
    return NoInternetFailure();
  }
}

class AuthorizationException implements AppException {
  @override
  AuthorizationFailure get toFailure {
    return AuthorizationFailure();
  }
}

class TimeoutServerException implements AppException {
  @override
  TimeoutFailure get toFailure {
    return TimeoutFailure();
  }
}

class SystemAlertException implements AppException {
  final String message;
  final dynamic payload;

  SystemAlertException({
    required this.message,
    this.payload,
  });

  @override
  SystemAlertFailure get toFailure {
    return SystemAlertFailure.fromException(this);
  }
}
