import 'package:flutter/material.dart';

import '../screens/base/IScreenBuilder.dart';

abstract class BasePage extends StatelessWidget implements IScreenBuilder {
  /**
   * Return screen name
   */
  String getScreenName() => "";

  /**
   * Send event to firebase analytics console
   */
  Future<void>? sendAnalyticsEvent() => null;
}
