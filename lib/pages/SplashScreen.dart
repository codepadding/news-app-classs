import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // Timer(Duration(seconds: 1), () => Navigator.pushNamed(context, "home"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
