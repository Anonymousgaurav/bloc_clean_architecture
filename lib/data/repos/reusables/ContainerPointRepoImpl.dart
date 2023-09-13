import 'dart:io';

import 'package:custom_bloc_state_management/business/repos/reusables/ContainerPointRepo.dart';
import 'package:custom_bloc_state_management/data/exception/DataException.dart';
import 'package:custom_bloc_state_management/models/resuables/ReusableContainerModel.dart';
import 'package:custom_bloc_state_management/network/api/reusable/IGetContainerApi.dart';
import 'package:custom_bloc_state_management/network/exception/TokenException.dart';
import 'package:custom_bloc_state_management/utils/Logger.dart';

const TAG = "BussinessChallengeRepoImpl";

class ContainerPointRepoImpl implements ContainerPointRepo {
  final IGetContainerApi _getContainerApi;

  const ContainerPointRepoImpl(this._getContainerApi);

  @override
  Future<List<ReusableContainerModel>> getContainerPoint(
      {required int id, required String token}) async {
    try {
      final resp = await this
          ._getContainerApi
          .getResuableContainer(id: id, token: token);

      if (resp!.data == null)
        return List.empty();
      else
        return resp.data.reusables;
    } on TokenException catch (te) {
      Logger.e(msg: "getContainerPoint()", error: te);

      throw te;
    } on IOException catch (ioe) {
      Logger.e(msg: "getContainerPoint()", error: ioe);

      throw ioe;
    } on Exception catch (e) {
      Logger.e(msg: "getContainerPoint()", error: e);

      throw DataException();
    }
  }
}
