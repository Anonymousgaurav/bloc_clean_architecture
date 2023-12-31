import 'package:custom_bloc_state_management/models/dto/BaseDTO.dart';
import 'package:custom_bloc_state_management/models/session/SessionModel.dart';

class LocalSessionDTO extends BaseDTO {
  SessionModel sessionModel;

  LocalSessionDTO({required this.sessionModel}) : super();
}
