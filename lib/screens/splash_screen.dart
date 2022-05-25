import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/splash";

  final String redirectRouteName;

  const SplashScreen({
    Key? key,
    this.redirectRouteName = '/',
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // 延迟 5s
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed(widget.redirectRouteName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
