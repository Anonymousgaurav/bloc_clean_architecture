import 'package:custom_bloc_state_management/models/ErrorModel.dart';

/**
 * Data model for operation results. It contains a status and data or error. Specifically:
 * - a given state (either IN_PROGRESS, OK or KO)
 * - some data of type T (when result is OK)
 * - some error model (when result is KO)
 * */
class ResourceResult<T> {
  ResourceState? state;
  T? data;
  ErrorModel? error;

  ResourceResult({this.state = ResourceState.LOADING, this.data, this.error});

  bool _validData() => this.data != null;

  bool _validError() => this.error != null;

  bool _isIterable() => this._validData() && (this.data is Iterable);

  bool hasDataButEmpty() =>
      (this._isIterable()) && ((this.data as Iterable).isEmpty);

  bool hasData() => this._validData();

  bool hasError() => !this._validData() && this._validError();

  bool isSuccess() => this.state == ResourceState.SUCCESS;

  bool isError() => this.state == ResourceState.ERROR;
}

/**
 * Enumeration for result states
 */
enum ResourceState { INITIAL, LOADING, SUCCESS, ERROR }
