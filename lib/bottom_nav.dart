
import 'package:flutter/material.dart';
import 'package:nested_navigator/App.dart';
import 'package:nested_navigator/constants.dart';
import 'package:nested_navigator/custom_router.dart';
import 'package:nested_navigator/screens/create_post/create_post_screen.dart';
import 'package:nested_navigator/screens/explore/explore_screen.dart';
import 'package:nested_navigator/screens/favorite/favorite_screen.dart';
import 'package:nested_navigator/screens/feed/feed_screen.dart';
import 'package:nested_navigator/screens/profile/profile_screen.dart';

class BottomNav extends StatelessWidget {
  final BottomNavItem item;
  final GlobalKey<NavigatorState> navigatorKey;

  const BottomNav({
    Key? key,
    required this.navigatorKey,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('item => ${item}');
    return Navigator(
      key: navigatorKey,
      initialRoute: App.routeName,
      onGenerateRoute: CustomRouter.generateTabNestedRoute,
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