import 'dart:async';

import 'package:flutter/widgets.dart';

class HomePageProvider extends InheritedWidget {
  int initialPage;

  StreamController<int> indexController = StreamController<int>.broadcast();

  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  HomePageProvider({Key? key, required Widget child, required this.initialPage})
      : super(key: key, child: child);

  static HomePageProvider? of(BuildContext context) {
    return context.findAncestorWidgetOfExactType();
  }
}
