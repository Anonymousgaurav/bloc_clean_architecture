import 'package:custom_bloc_state_management/business/ErrorCodes.dart';
import 'package:custom_bloc_state_management/business/bloc/Bloc.dart';
import 'package:custom_bloc_state_management/business/repos/local_db/ILocalSessionRepo.dart';
import 'package:custom_bloc_state_management/data/exception/DataException.dart';
import 'package:custom_bloc_state_management/data/repos/local_db/LocalSessionRepoImpl.dart';
import 'package:custom_bloc_state_management/models/dto/local_db/LocalSessionDTO.dart';
import 'package:custom_bloc_state_management/utils/Logger.dart';

const String TAG = "InsertLocalBloc";

class InsertSessionLocalBloc extends Bloc<LocalSessionDTO, bool> {
  final ILocalSessionRepo _repo = LocalSessionRepoImpl();

  InsertSessionLocalBloc() : super();

  @override
  void performOperation(LocalSessionDTO dto) async {
    var res;
    try {
      Logger.i(tag: TAG, msg: "performOperation:dto:" + dto.toString());
      final data = await _repo.deleteInsertUser(
          id: 1, localSessionModel: dto.sessionModel);
      res = buildResult(data: data);
      Logger.i(tag: TAG, msg: "performOperation:res:" + res.toString());
    } on DataException catch (e) {
      Logger.e(tag: TAG, msg: "inputOperation()", error: e);

      res = buildResult(data: null, code: ErrorCodes.DATA_ERROR);
    } on Exception catch (e) {
      Logger.e(tag: TAG, msg: "inputOperation()", error: e);

      res = buildResult(data: null, code: ErrorCodes.INSERT_DB_ERROR);
    } finally {
      processData(res);
    }
  }
}
