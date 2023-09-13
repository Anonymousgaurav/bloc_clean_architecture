import 'package:flutter/material.dart';

import 'bloc/Bloc.dart';

/// Factory for BLoC widgets.
class BlocProvider<T extends Bloc> extends StatefulWidget {
  final Widget child;
  final T bloc;

  const BlocProvider({Key? key, required this.child, required this.bloc})
      : super(key: key);

  static T ofType<T extends Bloc>(BuildContext cntxt) {
    final type = _providerType<BlocProvider<T>>();
    final BlocProvider<T>? provider = cntxt.findAncestorWidgetOfExactType();
    return provider!.bloc;
  }

  static Type _providerType<T>() => T;

  @override
  State<StatefulWidget> createState() => _BlocProviderState();
}

/// Inner class used to store state
class _BlocProviderState extends State<BlocProvider> {
  @override
  Widget build(BuildContext context) => widget.child;

  @override
  void dispose() {
    this.widget.bloc.dispose();
    super.dispose();
  }
}
