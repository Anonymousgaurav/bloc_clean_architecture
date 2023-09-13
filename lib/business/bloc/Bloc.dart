import 'dart:async';

import 'package:custom_bloc_state_management/models/ErrorModel.dart';
import 'package:custom_bloc_state_management/models/dto/BaseDTO.dart';
import 'package:custom_bloc_state_management/models/dto/ResourceResult.dart';

/// Base class for business logic components (BLoC's).
/// Opens data channel with binded widget.
///
/// Uses parametric types for both input and output types:
/// - In: data type used for bloc data input
/// - Out: data type returned by operation. Will be wrapped inside an ResourceResult when sent to UI
///
/// Child classes must override abstract methods.
abstract class Bloc<In extends BaseDTO, Out> {
  /// Stream controller
  final StreamController<ResourceResult<Out>> controller =
      StreamController<ResourceResult<Out>>();

  /// Data stream (pipe) with binded widget
  Stream<ResourceResult<Out>>? get dataStream => this.controller.stream;

  /// Abstraction to perform some operation using params received.
  /// Must be overriden by children.
  void performOperation(In dto);

  /// Send data to binded widget automatically triggering a rebuild
  void processData(ResourceResult<Out>? data) {
    //XXX: send data down the pipe...
    if (!this.controller.isClosed && data != null) {
      this.controller.sink.add(data);
    }
  }

  /// Free resources
  void dispose() {
    this.controller.close();
  }

  /// Encapsulate build result objects creation to avoid inconsistencies
  ResourceResult<Out> buildResult({Out? data, int code = -1}) {
    ResourceResult<Out> res = ResourceResult();

    res.data = data;
    res.state = res.hasData() ? ResourceState.SUCCESS : ResourceState.ERROR;
    res.error = (res.isError() ? ErrorModel(code: code) : null);

    return res;
  }
}
