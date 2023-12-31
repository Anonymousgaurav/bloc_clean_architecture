import 'package:custom_bloc_state_management/business/repos/local_db/ILocalSessionRepo.dart';
import 'package:custom_bloc_state_management/database/dao/SessionDAO.dart';
import 'package:custom_bloc_state_management/models/session/SessionModel.dart';

const String TAG = "LocalSessionRepoImpl";

class LocalSessionRepoImpl implements ILocalSessionRepo {
  static const int TARGET_ID = 1;

  LocalSessionRepoImpl() : super();

  final SessionDAO sessionDAO = SessionDAO();

  @override
  Future<bool> addUser({SessionModel? localSessionModel}) async {
    return await sessionDAO.insertUser(localSessionModel);
  }

  @override
  Future<bool> deleteUser({int id = TARGET_ID}) async {
    return await sessionDAO.deleteUser(id);
  }

  @override
  Future<bool> updateUser(
      {int id = TARGET_ID, SessionModel? localSessionModel}) async {
    await sessionDAO.deleteUser(id);
    return await sessionDAO.insertUser(localSessionModel);
  }

  @override
  Future<SessionModel?> retrieveUser({int id = TARGET_ID}) async {
    return await sessionDAO.getUser(id);
  }

  @override
  Future<bool> deleteInsertUser(
      {int id = TARGET_ID, SessionModel? localSessionModel}) async {
    await sessionDAO.deleteUser(id);
    return await sessionDAO.insertUser(localSessionModel);
  }
}
