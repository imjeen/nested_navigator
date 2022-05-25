import 'package:flutter/material.dart';

class CommentsScreen extends StatelessWidget {
  static const String routeName = "/comments";

  const CommentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
      ),
      body: Center(
        child: Text('comments screen'),
      ),
    );
  }
}
