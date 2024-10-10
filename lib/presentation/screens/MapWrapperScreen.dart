import 'package:flutter/material.dart';

import '../factories/IconButtonFactory.dart';
import '../widgets/BottomNavigationWidget.dart';


const String TAG = "MapWrapperScreen";

class MapWrapperScreen extends StatefulWidget {
  MapWrapperScreen({Key? key}) : super(key: key);

  @override
  _MapWrapperScreenState createState() => _MapWrapperScreenState();

  static PageWidget buildPageWidget(BuildContext context) {
    return PageWidget(
      navItem: BottomNavigationBarItem(
        icon: IconButtonFactory.bottomNavIcon(false, Icons.map),
        label: "Map",
        activeIcon:
        IconButtonFactory.bottomNavIcon(true, Icons.map),
      ),
      active: true,
    );
  }
}

class _MapWrapperScreenState extends State<MapWrapperScreen>
    with AutomaticKeepAliveClientMixin<MapWrapperScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return this.buildCurrent(context);
  }

  Widget buildCurrent(BuildContext cntxt) {
    return Center(
      child: Text('Profile Screen'),
    );
  }


  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    super.dispose();
  }
}
