import 'dart:async';
import 'package:final_project/provider/Auth_Provider.dart';
import 'package:final_project/transition/transition.dart';
import 'package:flutter/material.dart';

import '../introduction_screen/IntroductionScreen.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "SplashScreen";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds:3),
          () => Navigator.pushReplacementNamed(context,ProviderAuth.checkLogin==false?IntroductionScreen.routeName:Transition.routeName)

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/logo.png',
              height: 300,
              width: 300,
            ),
            SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}
