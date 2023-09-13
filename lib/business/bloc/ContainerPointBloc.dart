import 'dart:io';

import 'package:custom_bloc_state_management/business/ErrorCodes.dart';
import 'package:custom_bloc_state_management/business/bloc/Bloc.dart';
import 'package:custom_bloc_state_management/business/repos/reusables/ContainerPointRepo.dart';
import 'package:custom_bloc_state_management/data/exception/DataException.dart';
import 'package:custom_bloc_state_management/models/dto/reusables/ContainerPointDTO.dart';
import 'package:custom_bloc_state_management/models/resuables/ReusableContainerModel.dart';
import 'package:custom_bloc_state_management/network/exception/TokenException.dart';
import 'package:custom_bloc_state_management/utils/Logger.dart';

const String TAG = "BussinessChallengeBloc";

class ContainerPointBloc
    extends Bloc<ContainerPointDTO, List<ReusableContainerModel>> {
  final ContainerPointRepo _repo;

  ContainerPointBloc(this._repo) : super();

  @override
  void performOperation(ContainerPointDTO dto) async {
    var res;
    try {
      final data = await this._repo.getContainerPoint(id: 1, token: dto.token);

      res = this.buildResult(data: data);
    } on TokenException catch (te) {
      res = this.buildResult(data: null, code: ErrorCodes.API_ERROR);
    } on DataException catch (de) {
      res = this.buildResult(data: null, code: ErrorCodes.API_ERROR);
    } on IOException catch (ioe) {
      res = this.buildResult(data: null, code: ErrorCodes.API_ERROR);
    } on Exception catch (e) {
      Logger.e(tag: TAG, msg: "performOperation()", error: e);
      res = this.buildResult(data: null, code: ErrorCodes.API_ERROR);
    } finally {
      this.processData(res);
    }
  }
}
