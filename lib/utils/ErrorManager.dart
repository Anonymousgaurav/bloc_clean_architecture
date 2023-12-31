import 'package:custom_bloc_state_management/business/ErrorCodes.dart';
import 'package:custom_bloc_state_management/models/ErrorModel.dart';
import 'package:custom_bloc_state_management/resources/ColorsRes.dart';
import 'package:flutter/material.dart';

abstract class ErrorManager {
  static void manageError(BuildContext cntxt, ErrorModel error) {
    switch (error.code) {
      case ErrorCodes.API_ERROR:
        showDialog(
            barrierDismissible: true,
            context: cntxt,
            builder: (cntxt) => _buildOneButtonDialog(
                  cntxt,
                  "Net Error",
                  "Net Error Description",
                ));
        break;

      default:
        showDialog(
            barrierDismissible: true,
            context: cntxt,
            builder: (cntxt) => _buildOneButtonDialog(
                  cntxt,
                  "General Error",
                  "General Error Description",
                ));
        break;
    }
  }

  static Widget _buildOneButtonDialog(
          BuildContext cntxt, String title, String descrip) =>
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            AlertDialog(
              title: Text(title),
              content: Column(
                children: <Widget>[
                  Icon(
                    Icons.warning,
                    size: _Dimens.ICON_SIZE,
                    color: ColorsRes.cardBannerColor,
                  ),
                  Text(descrip)
                ],
              ),
              actions: <Widget>[
                TextButton(
                  child: Text("Accept"),
                  onPressed: () {
                    Navigator.of(cntxt, rootNavigator: true).pop();
                  },
                )
              ],
            )
          ],
        ),
      );
}

abstract class _Dimens {
  static const double SEPARATOR = 10.0;
  static const double ICON_SIZE = 50.0;
}
