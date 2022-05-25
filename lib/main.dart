import 'package:flutter/material.dart';
import 'package:nested_navigator/App.dart';
import 'package:nested_navigator/custom_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nested Navigator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: App.routeName,
      onGenerateRoute: CustomRouter.onGenerateRoute,
    );
  }
}
