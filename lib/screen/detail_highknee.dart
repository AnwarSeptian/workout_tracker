import 'package:flutter/material.dart';
import 'package:workout_tracker/constant/app_color.dart';

class DetailHighknee extends StatelessWidget {
  const DetailHighknee({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.hitam2,
      appBar: AppBar(
        title: Text(
          "HIGH KNEE",
          style: TextStyle(
            color: AppColor.hitam2,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColor.cream2,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              margin: EdgeInsets.symmetric(horizontal: 28, vertical: 12),
              child: Column(
                children: [
                  Text(
                    "Riwayat Latihan High Knee",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Divider(),
                  SizedBox(height: 20),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Card(child: ListTile());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
