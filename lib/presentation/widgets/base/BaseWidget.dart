import 'package:custom_bloc_state_management/resources/ColorsRes.dart';
import 'package:custom_bloc_state_management/utils/Logger.dart';
import 'package:flutter/material.dart';

abstract class BaseWidget extends StatelessWidget {
  BaseWidget({Key? key});

  @override
  Widget build(BuildContext context);

  Widget emptyWithRetry(BuildContext cntxt, String msg) => Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        Text(msg),
        TextButton(
            onPressed: () {
              onRetry(cntxt);
            },
            child: Text("Action Retry"))
      ]));

  Widget empty(BuildContext cntxt, String msg) => Center(child: Text(msg));

  Widget loading(
          {BuildContext? cntxt, String msg = "...", bool visible = true}) =>
      Visibility(
        visible: visible,
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(ColorsRes.primaryColor),
          ),
        ),
      );

  /**
   * Function hooked in emptyWithRetry() call
   *
   * Override in children to specify behavior
   */
  void onRetry(BuildContext context) {
    Logger.log("Retrying...");
  }
}
