import 'package:flutter/material.dart';
import 'package:nested_navigator/screens/bottom_nav.dart';

import '../constants.dart';

class AppScreen extends StatefulWidget {
  static const String routeName = '/';
  const AppScreen({Key? key}) : super(key: key);

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  // 图标
  final Map<BottomNavItem, IconData> items = {
    BottomNavItem.feed: Icons.home,
    BottomNavItem.explore: Icons.explore,
    BottomNavItem.create: Icons.add,
    BottomNavItem.favorite: Icons.favorite_border,
    BottomNavItem.profile: Icons.account_circle
  };
  // Key 值
  final Map<BottomNavItem, GlobalKey<NavigatorState>> navigatorKeys = {
    BottomNavItem.feed: GlobalKey<NavigatorState>(),
    BottomNavItem.explore: GlobalKey<NavigatorState>(),
    BottomNavItem.create: GlobalKey<NavigatorState>(),
    BottomNavItem.favorite: GlobalKey<NavigatorState>(),
    BottomNavItem.profile: GlobalKey<NavigatorState>(),
  };

  BottomNavItem selectedItem = BottomNavItem.feed;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: _buildBody(),
        bottomNavigationBar: _buildTabs(),
      ),
    );
  }

  //  底部 Tabs
  BottomNavigationBar _buildTabs() {
    return BottomNavigationBar(
      items: items
          .map(
            (item, icon) => MapEntry(
              item.toString(),
              BottomNavigationBarItem(label: '', icon: Icon(icon, size: 30.0)),
            ),
          )
          .values
          .toList(),
      onTap: (index) {
        final currentItem = BottomNavItem.values[index];
        print('currentItem ${currentItem}');
        if (currentItem == selectedItem) {
          navigatorKeys[currentItem]
              ?.currentState
              ?.popUntil((route) => route.isFirst);
        }
        setState(() {
          selectedItem = currentItem;
        });
      },
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.grey,
      currentIndex: BottomNavItem.values.indexOf(selectedItem),
    );
  }

  // 主体
  Stack _buildBody() {
    return Stack(
      children: items
          .map(
            (item, _) => MapEntry(
              item,
              Offstage(
                offstage: item != selectedItem,
                child:
                    BottomNav(navigatorKey: navigatorKeys[item]!, item: item),
              ),
            ),
          )
          .values
          .toList(),
    );
  }
}
