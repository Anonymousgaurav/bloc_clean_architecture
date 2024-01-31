import 'package:custom_bloc_state_management/business/BlocProvider.dart';
import 'package:custom_bloc_state_management/business/bloc/Bloc.dart';
import 'package:custom_bloc_state_management/models/dto/ResourceResult.dart';
import 'package:custom_bloc_state_management/presentation/widgets/base/BaseStatefulWidgetState.dart';
import 'package:flutter/material.dart';

import 'BaseBlocProvider.dart';

abstract class BaseStatefulWidgetState4BLoC<S extends StatefulWidget,
    T extends Bloc, R> extends BaseStatefulWidgetState<S> {
  T? bloc;

  @override
  void initState() {
    this.initBloc(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   bloc: this.bloc!,
    //   child: this._buildStreamForWidget(bloc!),
    // );

    return BaseBlocProvider<T>(
      bloc: this.bloc!,
      child: this._buildStreamForWidget(bloc!),
    );
  }

  /// Open stream builder for communication between widget and BLoC.
  Widget _buildStreamForWidget(T bloc) => StreamBuilder<ResourceResult<R>>(
      stream: this.bloc?.dataStream as Stream<ResourceResult<R>>?,
      builder: (context, snapshot) =>
          this.displayResult(context, snapshot.data));

  /**
   * BLoC initialization.
   * Must be overriden by subclasses to create specific bloc instance.
   */
  void initBloc(BuildContext context);

  /**
   * Example of BLoC retrieval from anywhere in the widget tree.
   */
  T retrieveBloc(BuildContext cntxt) => BlocProvider.ofType<T>(cntxt);

  /**
   * Callback called when BLoC operation has been performed.
   * Must be overriden by subclasses to paint UI.
   */
  Widget displayResult(BuildContext cntxt, ResourceResult<R>? data);

  @override
  String getScreenName() => this.runtimeType.toString();
}
