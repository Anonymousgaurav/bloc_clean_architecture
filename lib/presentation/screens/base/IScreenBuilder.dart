import 'package:flutter/material.dart';

/**
 * Abstraction for base classes
 */
abstract class IScreenBuilder {
  /**
   * Build app bar for screen
   */
  PreferredSizeWidget? buildAppBar(BuildContext context);

  /**
   * Build content for screen
   */
  Widget? buildBody(BuildContext context);

  /**
   * Build bottom navigation nav
   */
  Widget? buildBottomNav(BuildContext context);

  /**
   * Return screen name
   */
  String getScreenName();

  /**
   * Send event to firebase analytics console
   */
  Future<void>? sendAnalyticsEvent();
}
