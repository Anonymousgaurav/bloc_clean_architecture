import 'package:flutter/material.dart';

import '../factories/IconButtonFactory.dart';
import '../widgets/BottomNavigationWidget.dart';
import 'base/BaseScreenStateful.dart';

class HomePageWrapperScreen extends BaseScreenStateful {
  HomePageWrapperScreen({Key? key, this.controller}) : super(key: key);

  final HomePageWrapperScreenController? controller;

  @override
  _HomePageWrapperScreenState createState() =>
      _HomePageWrapperScreenState();

////////////////////////////////////////////////////////////////////////////////////////////////
  /// <PAGER>
////////////////////////////////////////////////////////////////////////////////////////////////

  static PageWidget buildPageWidget(BuildContext context) {
    return PageWidget(
      navItem: BottomNavigationBarItem(
        icon: IconButtonFactory.bottomNavIcon(false, Icons.home),
        label: "Home",
        activeIcon:
        IconButtonFactory.bottomNavIcon(true, Icons.home),
      ),
      active: true,
    );
  }

////////////////////////////////////////////////////////////////////////////////////////////////
/// <PAGER>
////////////////////////////////////////////////////////////////////////////////////////////////
}

class _HomePageWrapperScreenState extends State<HomePageWrapperScreen>
    with AutomaticKeepAliveClientMixin<HomePageWrapperScreen> {

  @override
  void initState() {
    super.initState();
    this.widget.controller?._addState(this);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Collab page'),
    );
  }

  void skipInitialPage() {

  }

  void _navigateToPage(int page) {

  }

  @override
  bool get wantKeepAlive => true;

}

class HomePageWrapperScreenController {
  _HomePageWrapperScreenState? _state;
  int? initialTab;

  void _addState(_HomePageWrapperScreenState state) {
    this._state = state;
    if (initialTab != null) {
      _state!._navigateToPage(initialTab!);
    }
  }

  /// Determine if the CollaborateWrapperScreenController is attached to an instance
  /// of the CollaborateWrapperScreen (this property must return true before any other
  /// functions can be used)
  bool get isAttached => _state != null;

  void _checkAttachment() {
    assert(isAttached,
    "CollaborateWrapperScreenController must be attached to a CollaborateWrapperScreen");
  }

  void skipPage() {
    if (isAttached) {
      _checkAttachment();
      this._state!.skipInitialPage();
    }
  }

  void changeTab(int tab) {
    if (isAttached) {
      _state!._navigateToPage(tab);
    } else {
      initialTab = tab;
    }
  }
}
