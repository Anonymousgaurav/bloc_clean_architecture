import 'package:custom_bloc_state_management/business/ErrorCodes.dart';
import 'package:custom_bloc_state_management/business/bloc/Bloc.dart';
import 'package:custom_bloc_state_management/business/repos/local_db/ILocalSessionRepo.dart';
import 'package:custom_bloc_state_management/data/exception/DataException.dart';
import 'package:custom_bloc_state_management/data/repos/local_db/LocalSessionRepoImpl.dart';
import 'package:custom_bloc_state_management/models/dto/local_db/LocalSessionDTO.dart';
import 'package:custom_bloc_state_management/models/session/SessionModel.dart';
import 'package:custom_bloc_state_management/utils/Logger.dart';

const String TAG = "UpdateLocalSessionBloc";

class UpdateLocalSessionBloc extends Bloc<LocalSessionDTO, bool> {
  final ILocalSessionRepo _repo = LocalSessionRepoImpl();

  UpdateLocalSessionBloc() : super();

  @override
  void performOperation(LocalSessionDTO dto) async {
    var res;
    try {
      final data = await _repo.updateUser(localSessionModel: dto.sessionModel);
      res = buildResult(data: data);
    } on DataException catch (e) {
      Logger.e(tag: TAG, msg: "deleteOperation()", error: e);

      res = buildResult(data: null, code: ErrorCodes.DATA_ERROR);
    } on Exception catch (e) {
      Logger.e(tag: TAG, msg: "deleteOperation()", error: e);

      res = buildResult(data: null, code: ErrorCodes.UPDATE_DB_ERROR);
    } finally {
      processData(res);
    }
  }
}
