import 'package:custom_bloc_state_management/presentation/widgets/BottomNavigationWidget.dart';
import 'package:flutter/material.dart';

class NavigationProvider extends InheritedWidget {
  final BottomNavigationWidgetController ctrl;
  final Widget child;

  const NavigationProvider({
    required this.ctrl,
    required this.child,
    Key? key,
  }) : super(key: key, child: child);

  static NavigationProvider? of(BuildContext cntxt) {
    return cntxt.findAncestorWidgetOfExactType();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
