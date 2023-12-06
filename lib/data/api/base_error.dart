class BaseError {
  String? errorMessage;

  BaseError({required this.errorMessage});
}

class ServerError extends BaseError {
  ServerError({required super.errorMessage});
}

class NetworkError extends BaseError {
  NetworkError({required super.errorMessage});
}
