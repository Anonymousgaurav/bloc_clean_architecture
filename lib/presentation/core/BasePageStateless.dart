import 'package:flutter/material.dart';

import 'BasePage.dart';


abstract class BasePageStateless extends StatelessWidget implements BasePage {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: this.buildAppBar(context),
      body: this.buildBody(context),
      bottomNavigationBar: this.buildBottomNav(context),
    ));
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  @override
  Widget? buildBottomNav(BuildContext context) => null;

  /**
   * Return screen name
   */
  String getScreenName() => this.runtimeType.toString();

  /**
   * Send event to firebase analytics console
   */
  Future<void>? sendAnalyticsEvent() => null;
}
