import 'package:custom_bloc_state_management/models/ErrorModel.dart';
import 'package:custom_bloc_state_management/utils/ErrorManager.dart';
import 'package:custom_bloc_state_management/utils/Logger.dart';
import 'package:flutter/material.dart';

abstract class BaseStatefulWidgetState<T extends StatefulWidget>
    extends State<T> {
  @override
  Widget build(BuildContext context) {
    return Container(width: 0.0, height: 0.0);
  }

  Widget emptyWithRetry(BuildContext cntxt, String msg) => Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        Text(msg),
        FlatButton(
            onPressed: () {
              onRetry();
            },
            child: Text("Retry"))
      ]));

  Widget empty(String msg) => Center(child: Text(msg));

  Widget loading({String msg = "...", bool visible = true}) => Visibility(
        visible: visible,
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
          ),
        ),
      );

  /**
   * Function hooked in emptyWithRetry() call
   *
   * Override in children to specify behavior
   */
  void onRetry() {
    Logger.log("Retrying...");
  }

  void error(BuildContext cntxt, ErrorModel e) =>
      ErrorManager.manageError(cntxt, e);
}
