import 'package:custom_bloc_state_management/presentation/screens/ContributeWrapperScreen.dart';
import 'package:custom_bloc_state_management/presentation/screens/MapWrapperScreen.dart';
import 'package:flutter/material.dart';

import '../../resources/ColorsRes.dart';
import '../core/BasePage.dart';
import '../inherited/HomePageProvider.dart';
import '../inherited/NavigationProvider.dart';
import '../widgets/BottomNavigationWidget.dart';
import '../widgets/ViewPagerWidget.dart';
import 'HomePageWrapperScreen.dart';


/// Home page
class HomePage extends BasePage {
  static const int HOME_TAB = 0;
  static const int MAP_TAB = 1;
  static const int CHALLENGES_TAB = 2;
  static const int JOIN_TAB = 3;
  static const int PROFILE_TAB = 4;

  final int INITIAL_PAGE;

  HomePage({this.INITIAL_PAGE = 0});

  final BottomNavigationWidgetController navController =
  BottomNavigationWidgetController();

  bool skipCollabPage = false;

  @override
  Widget build(BuildContext context) {
  return  NavigationProvider(
    ctrl: this.navController,
    child: HomePageProvider(
      initialPage: INITIAL_PAGE == null ? HOME_TAB : INITIAL_PAGE,
      child: SafeArea(
          child: Scaffold(
            appBar: this.buildAppBar(context),
            body: this.buildBody(context),
            bottomNavigationBar: this.buildBottomNav(context),
          ),
      ),
    ),
  );
  }


  /// Build app bar for screen
  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  /// Build content for screen
  @override
  Widget buildBody(BuildContext context) =>
      ViewPagerWidget(
        pageList: <Widget>[
          HomePageWrapperScreen(),
          MapWrapperScreen(),
          ContributeWrapperScreen()
        ],
      );

  /// Build bottom navigation nav
  @override
  Widget buildBottomNav(BuildContext context) {
    return Material(
        elevation: 8.0,
        child: Container(
          height: BottomNavigationWidget.HEIGHT,
          child: Row(children: <Widget>[
            this._buildBottomNavBar(context),
          ]),
        ));
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Expanded(
      flex: 5,
      child: BottomNavigationWidget(
        pageList: this._buildPageList(context),
        selectedColor: ColorsRes.iconActiveColor,
        unselectedColor: ColorsRes.iconUnactiveColor,
        controller: this.navController,
      ),
    );
  }

////////////////////////////////////////////////////////////////////////////////////////////////
  /// </BASE>
////////////////////////////////////////////////////////////////////////////////////////////////

  List<PageWidget> _buildPageList(BuildContext context) {
    return [
      HomePageWrapperScreen.buildPageWidget(context),
      MapWrapperScreen.buildPageWidget(context),
      ContributeWrapperScreen.buildPageWidget(context),
    ];
  }
}
