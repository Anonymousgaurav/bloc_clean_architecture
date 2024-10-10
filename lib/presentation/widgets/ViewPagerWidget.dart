import 'dart:async';

import 'package:flutter/material.dart';

import '../inherited/HomePageProvider.dart';
import 'base/BaseStatefulWidgetState.dart';

const ROLE_SHOPKEEPER = "SHOP";

class ViewPagerWidget extends StatefulWidget {
  final List<Widget> pageList;

  const ViewPagerWidget({Key? key, required this.pageList}) : super(key: key);

  @override
  _ViewPagerWidgetWidgetState createState() => _ViewPagerWidgetWidgetState();
}

class _ViewPagerWidgetWidgetState
    extends BaseStatefulWidgetState<ViewPagerWidget> {
  // PageView stuff
  PageController? _pageController;
  StreamSubscription<int>? _subscription;

  @override
  void initState() {
    super.initState();
    this._pageController = PageController(
      initialPage: HomePageProvider.of(context)!.initialPage,
      keepPage: true,
    );

    this._subscription?.cancel();
    this._subscription =
        HomePageProvider.of(context)?.indexController.stream.listen((value) {
          roleTypeSessionNavigation(value);
        });
  }

  Future<dynamic> roleTypeSessionNavigation(int value) async {
    return this._pageController?.jumpToPage(value);
  }

  @override
  void dispose() {
    _pageController?.dispose();
    _subscription?.cancel();
    super.dispose();
  }

////////////////////////////////////////////////////////////////////////////////////////////////
  /// <BUILDERS>
////////////////////////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: _pageController,
      onPageChanged: (index) {
        _pageChanged(index);
      },
      children: widget.pageList,
    );
  }

////////////////////////////////////////////////////////////////////////////////////////////////
  /// </BUILDERS>
////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////////
  /// <CALLBACKS>
////////////////////////////////////////////////////////////////////////////////////////////////
  // Updates PageView index
  void _pageChanged(int i) {
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }
////////////////////////////////////////////////////////////////////////////////////////////////
/// </CALLBACKS>
////////////////////////////////////////////////////////////////////////////////////////////////
}
