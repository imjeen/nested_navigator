import 'package:flutter/material.dart';
import 'package:nested_navigator/screens/app_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('login screen'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(AppScreen.routeName);
              },
              child: const Text('go to Feed page'),
            ),
          ],
        ),
      ),
    );
  }
}
