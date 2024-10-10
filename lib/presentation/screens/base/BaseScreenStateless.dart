import 'package:custom_bloc_state_management/utils/Logger.dart';
import 'package:flutter/material.dart';

import 'IScreenBuilder.dart';


/// Base class for screens that contain widgets (parts of the UI).
///
/// Child classes must override abstract methods.
abstract class BaseScreenStateless extends StatelessWidget
    implements IScreenBuilder {
  BaseScreenStateless({Key? key}) : super(key: key) {}

  @override
  Widget build(BuildContext context) {
    Logger.i(tag: this.getScreenName(), msg: ".build()");

    this.sendAnalyticsEvent();

    //XXX: return scaffold by default so contents can be laid out
    return Scaffold(
      appBar: this.buildAppBar(context),
      body: this.buildBody(context),
    );
  }

  /// Build app bar for screen
  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  /// Build bottom navigation nav
  Widget? buildBottomNav(BuildContext context) => null;

  /// Return screen name
  @override
  String getScreenName() => this.runtimeType.toString();

  /// Send event to firebase analytics console
  @override
  Future<void> sendAnalyticsEvent() async {
  }
}
