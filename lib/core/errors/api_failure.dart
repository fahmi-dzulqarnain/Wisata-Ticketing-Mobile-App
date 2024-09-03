import 'errors.dart';

class APIFailure extends Failure {
  const APIFailure({
    required super.message,
    required super.statusCode
  });

  APIFailure.fromException(APIException exception):
      this(
          message: exception.message,
          statusCode: exception.statusCode
      );
}