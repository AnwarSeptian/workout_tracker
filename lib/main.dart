import 'package:flutter/material.dart';
import 'package:workout_tracker/constant/app_color.dart';
import 'package:workout_tracker/home_screen.dart';
import 'package:workout_tracker/login_screen.dart';
import 'package:workout_tracker/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.cream2),
      ),
      debugShowCheckedModeBanner: false,

      initialRoute: "/",
      routes: {
        "/": (context) => SplashScreen(),
        "/login": (context) => LoginScreen(),

        LoginScreen.id: (context) => LoginScreen(),
        HomeScreen.id: (context) => HomeScreen(),
      },
      // home: LoginScreen(),
    );
  }
}
