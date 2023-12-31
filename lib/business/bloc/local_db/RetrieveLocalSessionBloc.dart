import 'dart:io';

import 'package:custom_bloc_state_management/business/ErrorCodes.dart';
import 'package:custom_bloc_state_management/business/bloc/Bloc.dart';
import 'package:custom_bloc_state_management/business/repos/local_db/ILocalSessionRepo.dart';
import 'package:custom_bloc_state_management/data/exception/DataException.dart';
import 'package:custom_bloc_state_management/data/repos/local_db/LocalSessionRepoImpl.dart';
import 'package:custom_bloc_state_management/models/dto/local_db/LocalSessionDTO.dart';
import 'package:custom_bloc_state_management/models/session/SessionModel.dart';
import 'package:custom_bloc_state_management/utils/Logger.dart';

const String TAG = "RetrieveLocalBloc";

class RetrieveLocalSessionBloc extends Bloc<LocalSessionDTO, SessionModel> {
  final ILocalSessionRepo _repo = LocalSessionRepoImpl();

  RetrieveLocalSessionBloc() : super();

  @override
  void performOperation(LocalSessionDTO dto) async {
    var res;
    try {
      final data = await _repo.retrieveUser(id: 1);
      res = buildResult(data: data);
    } on DataException catch (e) {
      Logger.e(tag: TAG, msg: "retrieveOperation()", error: e);

      res = buildResult(data: null, code: ErrorCodes.DATA_ERROR);
    } on Exception catch (e) {
      Logger.e(tag: TAG, msg: "retrieveOperation()", error: e);

      res = buildResult(data: null, code: ErrorCodes.READ_DB_ERROR);
    } finally {
      processData(res);
    }
  }
}
