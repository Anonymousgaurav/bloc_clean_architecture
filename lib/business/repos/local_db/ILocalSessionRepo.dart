import 'package:custom_bloc_state_management/models/session/SessionModel.dart';

abstract class ILocalSessionRepo {
  Future<bool> addUser({SessionModel localSessionModel});
  Future<SessionModel?> retrieveUser({int id});
  Future<bool> updateUser({SessionModel localSessionModel});
  Future<bool> deleteUser({int id});
  Future<bool> deleteInsertUser({int id, SessionModel? localSessionModel});
}
