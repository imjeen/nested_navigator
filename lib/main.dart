import 'package:flutter/material.dart';
import './App.dart';

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
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              settings: const RouteSettings(name: '/'),
              builder: (_) => App(),
            );

          case '/splash':
            return MaterialPageRoute(
              settings: const RouteSettings(name: '/splash'),
              builder: (_) => WillPopScope(
                  onWillPop: () async => false,
                  child: const Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )),
            );

          default:
            return MaterialPageRoute(
              settings: const RouteSettings(name: '/error'),
              builder: (_) => Scaffold(
                appBar: AppBar(
                  title: const Text('Error'),
                ),
                body: const Center(
                  child: Text('Something went wrong!'),
                ),
              ),
            );
        }
      },
    );
  }
}
