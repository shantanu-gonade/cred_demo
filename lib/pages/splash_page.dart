import 'package:demo_cred/pages/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: AuthScreen(),
      backgroundColor: NeumorphicColors.decorationDarkColor(
        Colors.green[50],
        intensity: 0.10,
      ),
      photoSize: 500,
      image: Image.asset(
        'assets/images/logo.png',
        scale: 12,
      ),
    );
  }
}
