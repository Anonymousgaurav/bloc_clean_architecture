import 'package:custom_bloc_state_management/network/response/reusables/ContainerPointResponse.dart';

abstract class IGetContainerApi {
  Future<ContainerPointResponse?> getResuableContainer(
      {required int id, required String token});
}
