import 'package:flutter/material.dart';

import '../factories/IconButtonFactory.dart';
import '../widgets/BottomNavigationWidget.dart';


const String TAG = "ContributeWrapperScreen";

class ContributeWrapperScreen extends StatefulWidget {
  ContributeWrapperScreen({Key? key}) : super(key: key);

  @override
  _ContributeWrapperScreenState createState() => _ContributeWrapperScreenState();

  static PageWidget buildPageWidget(BuildContext context) {
    return PageWidget(
      navItem: BottomNavigationBarItem(
        icon: IconButtonFactory.bottomNavIcon(false, Icons.control_camera_outlined),
        label: "Contribute",
        activeIcon:
        IconButtonFactory.bottomNavIcon(true, Icons.control_camera_outlined),
      ),
      active: true,
    );
  }
}

class _ContributeWrapperScreenState extends State<ContributeWrapperScreen>
    with AutomaticKeepAliveClientMixin<ContributeWrapperScreen> {
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
      child: Text('Contribute Screen'),
    );
  }


  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    super.dispose();
  }
}
