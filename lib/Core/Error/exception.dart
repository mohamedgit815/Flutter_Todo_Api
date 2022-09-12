import 'error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  const ServerException({
    required this.errorMessageModel
  });
}


class LocalException implements Exception {
  final String errorMessageModel;

  const LocalException({
    required this.errorMessageModel
  });

}