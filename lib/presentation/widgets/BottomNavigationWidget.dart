import 'package:flutter/material.dart';


import '../../styles/BottomNavigationStyles.dart';
import '../../utils/Logger.dart';
import '../inherited/HomePageProvider.dart';
import 'base/BaseStatefulWidgetState.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget(
      {Key? key,
        this.pageList,
        this.selectedColor,
        this.unselectedColor,
        this.controller})
      : super(key: key);

  static const double HEIGHT = 80.0;

  final List<PageWidget>? pageList;
  final Color? selectedColor;
  final Color? unselectedColor;
  final BottomNavigationWidgetController? controller;

  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();

  void navigate(int page) {
    Logger.i(tag: "BottomNavigationWidget", msg: "navigate:" + page.toString());
    this.controller?.setSelected(page);
  }
}

class _BottomNavigationWidgetState
    extends BaseStatefulWidgetState<BottomNavigationWidget> {
  int? _selectedIndex;
  Sink<int>? _indexSink;

  @override
  void initState() {
    Logger.i(tag: "_BottomNavigationWidgetState", msg: "initState()");
    super.initState();
    this._selectedIndex = HomePageProvider.of(context)?.initialPage;
    this._indexSink = HomePageProvider.of(context)?.indexController.sink;
    this.widget.controller?._addState(this);
  }

  @override
  void didUpdateWidget(BottomNavigationWidget oldWidget) {
    Logger.i(tag: "BottomNavigationWidget", msg: "didUpdateWidget()");
    super.didUpdateWidget(oldWidget);
    this.widget.controller?._addState(this);
  }

  @override
  void dispose() {
    this._indexSink?.close();
    super.dispose();
  }

////////////////////////////////////////////////////////////////////////////////////////////////
  /// <BUILDERS>
////////////////////////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> emptyList = List.empty(growable: true);
    var bottomItemList = emptyList;

    widget.pageList?.forEach((element) {
      bottomItemList.add(element.navItem!);
    });

    return BottomNavigationBar(
      selectedLabelStyle: BottomNavigationStyles.activeTitle,
      unselectedLabelStyle: BottomNavigationStyles.inActiveTitle,
      items: bottomItemList,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: widget.selectedColor,
      unselectedItemColor: widget.unselectedColor,
      currentIndex: _selectedIndex!,
      onTap: onItemTapped,
      elevation: 0.0,
    );
  }

////////////////////////////////////////////////////////////////////////////////////////////////
  /// </BUILDERS>
////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////////
  /// <CALLBACKS>
////////////////////////////////////////////////////////////////////////////////////////////////
  // Navigates the PageView
  void onItemTapped(int index) {
    if (widget.pageList![index].active!) {
      if (widget.pageList?[index].customClick != null) {
        widget.pageList?[index].customClick!();
      } else {
        setState(() {
          this._selectedIndex = index;
          this._indexSink?.add(this._selectedIndex!);
        });
      }
    }
  }
////////////////////////////////////////////////////////////////////////////////////////////////
/// </CALLBACKS>
////////////////////////////////////////////////////////////////////////////////////////////////
}

class BottomNavigationWidgetController {
  _BottomNavigationWidgetState? _state;

  void _addState(_BottomNavigationWidgetState state) {
    this._state = state;
  }

  /// Determine if the bottomNavigationWidgetController is attached to an instance
  /// of the BottomNavigationWidget (this property must return true before any other
  /// functions can be used)
  bool get isAttached => _state != null;

  void _checkAttachment() {
    assert(isAttached,
    "BottomNavigationWidgetController must be attached to a BottomNavigationWidget");
  }

  void setSelected(int index) {
    Logger.i(
        tag: "BottomNavigationWidgetController",
        msg: "navigate:" + index.toString());

    this._checkAttachment();
    this._state?.onItemTapped(index);
  }
}

class PageWidget {
  BottomNavigationBarItem? navItem;
  bool? active;
  Function? customClick;

  PageWidget({this.navItem, this.active, this.customClick});

  static PageWidget unactive(Widget icon, String title) {
    return PageWidget(
      navItem: BottomNavigationBarItem(
        icon: Opacity(
          opacity: 0.2,
          child: icon,
        ),
        label: title,
      ),
      active: false,
    );
  }

  static PageWidget activePage(Widget icon, String title) {
    return PageWidget(
      navItem: BottomNavigationBarItem(
        icon: icon,
        label: title,
      ),
      active: true,
    );
  }
}
