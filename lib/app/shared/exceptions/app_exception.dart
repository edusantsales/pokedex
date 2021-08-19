class AppException implements Exception {
  final String message;
  final String? statusMessage;
  final int? statusCode;

  const AppException(this.message, {this.statusMessage, this.statusCode});

  @override
  String toString() => 'AppException(message: $message, statusMessage: $statusMessage, statusCode: $statusCode)';
}
