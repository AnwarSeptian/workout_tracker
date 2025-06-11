import 'package:flutter/material.dart';
import 'package:workout_tracker/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String id = '/splashscreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void changePage() {
    Future.delayed(Duration(seconds: 3), () async {
      Navigator.pushNamedAndRemoveUntil(
        context,
        LoginScreen.id,
        (route) => false,
      );
    });
  }

  @override
  void initState() {
    changePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/splashscreen2.jpg"),

            SafeArea(
              child: Text(
                "Version 1.0.0",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
