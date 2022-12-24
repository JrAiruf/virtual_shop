// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class LoginError implements Exception {}

class UserError extends LoginError {
  UserError({required this.error});
  final String error;
}
