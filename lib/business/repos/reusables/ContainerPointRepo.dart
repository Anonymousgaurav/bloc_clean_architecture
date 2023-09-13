import 'package:custom_bloc_state_management/models/resuables/ReusableContainerModel.dart';

abstract class ContainerPointRepo {
  Future<List<ReusableContainerModel>> getContainerPoint(
      {required int id, required String token});
}
