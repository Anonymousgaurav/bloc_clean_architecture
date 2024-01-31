import 'package:custom_bloc_state_management/business/bloc/Bloc.dart';
import 'package:flutter/material.dart';


/// Factory for BLoC widgets.
class BaseBlocProvider<T extends Bloc> extends StatefulWidget {
  final Widget child;
  final T bloc;

  const BaseBlocProvider({Key? key, required this.child, required this.bloc})
      : super(key: key);

  static T ofType<T extends Bloc>(BuildContext cntxt) {
    final type = _providerType<BaseBlocProvider<T>>();
    final BaseBlocProvider<T>? provider = cntxt.findAncestorWidgetOfExactType();
    return provider!.bloc;
  }

  static Type _providerType<T>() => T;

  @override
  State<StatefulWidget> createState() => _BaseBlocProviderState();
}

/// Inner class used to store state
class _BaseBlocProviderState extends State<BaseBlocProvider> {
  @override
  Widget build(BuildContext context) => widget.child;

  @override
  void dispose() {
    this.widget.bloc.dispose();
    super.dispose();
  }
}
