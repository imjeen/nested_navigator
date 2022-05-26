import 'package:flutter/material.dart';
import 'package:nested_navigator/screens/app_screen.dart';
import 'package:nested_navigator/screens/comments/comments_screen.dart';
import 'package:nested_navigator/screens/edit_profile/edit_profile_screen.dart';
import 'package:nested_navigator/screens/login/login_screen.dart';
import 'package:nested_navigator/screens/splash_screen.dart';

class CustomRouter {
  // 顶层路由
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(
          settings: const RouteSettings(name: SplashScreen.routeName),
          builder: (_) => const SplashScreen(),
        );
      case AppScreen.routeName:
        return MaterialPageRoute(
          settings: const RouteSettings(name: AppScreen.routeName),
          builder: (_) => const AppScreen(),
        );
      case CommentsScreen.routeName:
        return MaterialPageRoute(
          settings: const RouteSettings(name: CommentsScreen.routeName),
          builder: (_) => const CommentsScreen(),
        );

      case LoginScreen.routeName:
        return MaterialPageRoute(
          settings: const RouteSettings(name: LoginScreen.routeName),
          builder: (_) => const LoginScreen(),
        );
      default:
        return _errorRoute(text: 'Not found route: ${settings.name}');
    }
  }

  // Tab Navigator 的嵌套路由
  static Route generateTabNestedRoute(RouteSettings settings) {
    switch (settings.name) {
      case EditProfileScreen.routeName:
        return MaterialPageRoute(
          settings: const RouteSettings(name: EditProfileScreen.routeName),
          builder: (_) => const EditProfileScreen(),
        );
      default:
        return _errorRoute(text: 'Not found nested route: ${settings.name}');
    }
  }

  static Route _errorRoute({String? text}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: Center(
          child: Text(text ?? 'Something went wrong!'),
        ),
      ),
    );
  }
}
