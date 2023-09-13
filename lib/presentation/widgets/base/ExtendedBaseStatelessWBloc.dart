import 'package:custom_bloc_state_management/business/BlocProvider.dart';
import 'package:custom_bloc_state_management/business/bloc/Bloc.dart';
import 'package:custom_bloc_state_management/models/ErrorModel.dart';
import 'package:custom_bloc_state_management/models/dto/ResourceResult.dart';
import 'package:custom_bloc_state_management/presentation/widgets/base/BaseWidget.dart';
import 'package:custom_bloc_state_management/utils/Logger.dart';
import 'package:flutter/material.dart';

/// Base class for widgets (parts of the UI) that use BLoC's
///
/// Uses parametric types:
/// - T: BLoC data type binded to widget
/// - R: result data type sent by BLoC once operation is performed
///
/// Abstract methods must be overriden by subclasses.
// ignore: must_be_immutable
abstract class ExtendedBaseWidgetStatelessWBLoC<T extends Bloc, R>
    extends BaseWidget {
  T? bloc;

  @override
  Widget build(BuildContext context) {
    Logger.i(tag: this.toString(), msg: ".build()");

    this.initBloc(context);

    return BlocProvider<T>(
      bloc: this.bloc!,
      child: this._buildStreamForWidget(bloc!),
    );
  }

  /// Open stream builder for communication between widget and BLoC.
  Widget _buildStreamForWidget(T bloc) => StreamBuilder<ResourceResult<R>>(
      stream: this.bloc!.dataStream as Stream<ResourceResult<R>>?,
      builder: (context, snapshot) =>
          this.displayResult(context, snapshot.data));

  /// BLoC initialization.
  /// Must be overriden by subclasses to create specific bloc instance.
  void initBloc(BuildContext context);

  /// Example of BLoC retrieval from anywhere in the widget tree.
  T retrieveBloc(BuildContext context) => BlocProvider.ofType<T>(context);

  /// Callback called when BLoC operation has been performed.
  Widget displayResult(BuildContext context, ResourceResult<R>? result) {
    if (result != null) {
      switch (result.state) {
        case ResourceState.LOADING:
          return this.buildLoadingState(context);
        case ResourceState.SUCCESS:
          return this.buildSuccessState(context, result.data!);
        case ResourceState.ERROR:
          return this.buildErrorState(context, result.error!);
        default:
      }
    }
    return this.buildInitialState(context);
  }

  /**
   * Builders per each state possible of ResourceResult
   * Must be overriden by subclasses to paint UI.
   */
  Widget buildInitialState(BuildContext context);

  Widget buildSuccessState(BuildContext context, R data);

  Widget buildLoadingState(BuildContext context);

  Widget buildErrorState(BuildContext context, ErrorModel error);
}
