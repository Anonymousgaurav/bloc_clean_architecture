import 'package:flutter/material.dart';

import '../../../utils/Logger.dart';
import 'IScreenBuilder.dart';


/**
 * Base class for screens that contain widgets (parts of the UI) and state.
 *
 * Child classes must override abstract methods.
 */
abstract class BaseScreenStateful extends StatefulWidget {
  BaseScreenStateful({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState();
}

abstract class StateForBaseScreen<T extends BaseScreenStateful> extends State<T>
    implements IScreenBuilder {
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

  /**
   * Build app bar for screen
   */
  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  /**
   * Build bottom navigation nav
   */
  Widget? buildBottomNav(BuildContext context) => null;

  /**
   * Return screen name
   */
  @override
  String getScreenName() => this.widget.runtimeType.toString();

  /**
   * Send event to firebase analytics console
   */
  @override
  Future<void> sendAnalyticsEvent() async {
  }
}
