import 'package:custom_bloc_state_management/business/BlocProvider.dart';
import 'package:custom_bloc_state_management/business/bloc/Bloc.dart';
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
abstract class BaseWidget4BLoC<T extends Bloc, R> extends BaseWidget {
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
      stream: this.bloc!.dataStream! as Stream<ResourceResult<R>>?,
      builder: (context, snapshot) =>
          this.displayResult(context, snapshot.data));

  /// BLoC initialization.
  /// Must be overriden by subclasses to create specific bloc instance.
  void initBloc(BuildContext context);

  /// Example of BLoC retrieval from anywhere in the widget tree.
  T retrieveBloc(BuildContext cntxt) => BlocProvider.ofType<T>(cntxt);

  /**
   * Callback called when BLoC operation has been performed.
   * Must be overriden by subclasses to paint UI.
   */
  Widget displayResult(BuildContext cntxt, ResourceResult<R>? data);
}
