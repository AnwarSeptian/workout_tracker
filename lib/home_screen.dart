import 'package:flutter/material.dart';
import 'package:workout_tracker/constant/app_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String id = "home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.hitam1,
        title: Text("Home", style: TextStyle(color: AppColor.cream2)),
        centerTitle: true,

        actions: [
          // IconButton(onPressed: () {}, icon: Icon(Icons.edit), iconSize: 24),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/enzo.png"),
              ),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Image.asset('assets/images/dribbel.png'),
                    Image.asset('assets/images/splashscreen.jpg'),
                    Image.asset('assets/images/images.jpg'),

                    // Container(width: 160, height: 60, color: Colors.amberAccent),
                    // Container(color: Colors.blueAccent),
                  ],
                ),
              ),
            ),
            Divider(thickness: 4),
          ],
        ),
      ),
    );
  }
}
