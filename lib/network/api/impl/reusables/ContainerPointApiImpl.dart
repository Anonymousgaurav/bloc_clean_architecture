import 'dart:convert';

import 'package:basic_utils/basic_utils.dart';
import 'package:custom_bloc_state_management/network/NetConfig.dart';
import 'package:custom_bloc_state_management/network/api/BaseApi.dart';
import 'package:custom_bloc_state_management/network/api/reusable/IGetContainerApi.dart';
import 'package:custom_bloc_state_management/network/response/reusables/ContainerPointResponse.dart';

class ContainerPointApiImpl extends BaseApi implements IGetContainerApi {
  const ContainerPointApiImpl() : super();

  @override
  Future<ContainerPointResponse?> getResuableContainer(
      {required int id, required String token}) async {
    final URL = NetConfig.getAllProducts();
    final resp = await HttpUtils.postForFullResponse(URL,
        queryParameters: this.parameters,
        headers: this.getSecureHeaders(token),
        );
    if (this.isSuccessful(resp)) {
      return ContainerPointResponse.fromJson(jsonDecode(resp.body));
    } else if (this.isNotAuthorized(resp)) {
      this.throwUnauthorized();
    } else {
      this.throwNetError(URL);
    }
  }
}
