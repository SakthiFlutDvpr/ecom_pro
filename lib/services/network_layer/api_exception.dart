class APIException implements Exception {
  final dynamic _message;
  final dynamic _prefix;

  APIException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends APIException {
  FetchDataException([String? message]) : super(message, "Error : ");
}

class BadRequestException extends APIException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends APIException {
  UnauthorisedException([message]) : super(message, "Unauthorised Request: ");
}

class InvalidInputException extends APIException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}
