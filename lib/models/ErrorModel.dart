import 'package:custom_bloc_state_management/business/ErrorCodes.dart';
import 'package:custom_bloc_state_management/models/BaseModel.dart';

/**
 * Data model for errors, containing a code and optional trace
 */
class ErrorModel implements BaseModel {
  int? code;
  String trace;

  ErrorModel({this.code, this.trace = ""});

  bool isSessionError() => (this.code == ErrorCodes.API_ERROR);
}
