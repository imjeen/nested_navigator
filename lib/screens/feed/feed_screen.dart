import 'package:flutter/material.dart';
import 'package:nested_navigator/screens/comments/comments_screen.dart';
import 'package:nested_navigator/screens/login/login_screen.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('feed screen', style: TextStyle(fontSize: 20.0)),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true)
                    .pushNamed(CommentsScreen.routeName);
              },
              child: const Text('go to comment'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true)
                    .pushNamedAndRemoveUntil(
                        LoginScreen.routeName, (_) => false);
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
