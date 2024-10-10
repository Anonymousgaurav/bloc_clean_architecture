import 'package:flutter/widgets.dart';

import '../resources/ColorsRes.dart';

class BottomNavigationStyles {
  static TextStyle get activeTitle {
    return TextStyle(
      fontSize: 13,
      color: ColorsRes.textTitleColor,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle get inActiveTitle {
    return TextStyle(
      fontSize: 13,
      color: ColorsRes.textTitleColor,
      fontWeight: FontWeight.w500,
    );
  }
}
