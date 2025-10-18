import 'package:http/http.dart' as http;

abstract class Failure {
  String error;
  Failure(this.error);
}

class ServerFailure extends Failure {
  ServerFailure(super.error);

  factory ServerFailure.fromHttpFailure(http.Response response) {
    switch (response.statusCode) {
      case 400:
        return ServerFailure('400 Bad request');
      case 401:
        return ServerFailure('401 You’re not authorized');
      case 403:
        return ServerFailure('403 Forbidden');
      case 404:
        return ServerFailure('404 The requested resource was not found');
      case 500:
        return ServerFailure('500 Internal Server Error');
      default:
        return ServerFailure('ooops  , please try again');
    }
  }
}
