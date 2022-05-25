import 'package:flutter/material.dart';
import 'package:nested_navigator/screens/create_post/create_post_screen.dart';
import 'package:nested_navigator/screens/explore/explore_screen.dart';
import 'package:nested_navigator/screens/favorite/favorite_screen.dart';
import 'package:nested_navigator/screens/feed/feed_screen.dart';
import 'package:nested_navigator/screens/profile/profile_screen.dart';

import './constants.dart';

class App extends StatefulWidget {
  static const String routeName = '/app';
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
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
                child: TabNavigator(
                    navigatorKey: navigatorKeys[item]!, item: item),
              ),
            ),
          )
          .values
          .toList(),
    );
  }
}

class TabNavigator extends StatelessWidget {
  final BottomNavItem item;
  final GlobalKey<NavigatorState> navigatorKey;

  const TabNavigator({
    Key? key,
    required this.navigatorKey,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('item => ${item}');
    return Navigator(
      key: navigatorKey,
      // initialRoute: '/detail',
      onGenerateRoute: (RouteSettings settings) {
        print('nested ${settings.name}, ${item}');
        WidgetBuilder builder;
        switch (settings.name) {
          case '/detail':
            builder = (BuildContext context) => const Center(
                  child: Text('nested detail'),
                );
            break;
          default:
            builder = (BuildContext context) => const Center(
                  child: Text('error'),
                );
        }
        return MaterialPageRoute<void>(builder: builder, settings: settings);
      },
      onGenerateInitialRoutes: (_, initialRoute) {
        List<MaterialPageRoute> routes = [];

        routes.add(MaterialPageRoute(
          settings: const RouteSettings(name: '/tab'),
          builder: (context) {
            switch (item) {
              case BottomNavItem.feed:
                return const FeedScreen();
              case BottomNavItem.explore:
                return const ExploreScreen();
              case BottomNavItem.create:
                return const CreatePostScreen();
              case BottomNavItem.favorite:
                return const FavoriteScreen();
              case BottomNavItem.profile:
                return const ProfileScreen();
              default:
                return const Center(
                  child: Text('error'),
                );
            }
          },
        ));

        return routes;
      },
    );
  }
}
