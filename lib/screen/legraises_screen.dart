import 'package:flutter/material.dart';
import 'package:workout_tracker/constant/app_color.dart';
import 'package:workout_tracker/simpan_latihan.dart';

class LegraisesScreen extends StatefulWidget {
  const LegraisesScreen({super.key});

  @override
  State<LegraisesScreen> createState() => _LegraisesScreenState();
}

class _LegraisesScreenState extends State<LegraisesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.hitam1,
        appBar: AppBar(
          title: Text("LEG RAISES"),
          backgroundColor: AppColor.cream1,
        ),
        body: Column(
          children: [
            Image.asset('assets/images/legraises.jpg'),
            Divider(color: AppColor.cream1, thickness: 8),
            Container(
              color: AppColor.cream1,
              width: double.infinity,
              child: Center(
                child: Text(
                  "Petunjuk Latihan",
                  style: TextStyle(
                    color: AppColor.cream2,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ),
            ),
            Divider(color: AppColor.cream1, thickness: 8),
            SizedBox(height: 20),
            Container(
              // height: 200,
              width: double.infinity,
              color: AppColor.cream1,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Posisi awal  :",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Berbaring telentang dengan kaki lurus dan tangan di samping tubuh.",
                    ),
                    Text("( SEPERTI CONTOH 1 )"),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            Container(
              // height: 200,
              width: double.infinity,
              color: AppColor.cream1,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Langkah Kedua  :",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Angkat kedua kaki lurus ke atas hingga membentuk sudut 90°. Turunkan perlahan tanpa menyentuh lantai, lalu ulangi.",
                    ),
                    Text("( SEPERTI CONTOH 2 )"),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            Container(
              // height: 200,
              width: double.infinity,
              color: AppColor.cream1,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Ulangi minimal 10x "),
                    Text("Jika Sudah berhasil di lakukan simpan latihan"),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SimpanLatihan()),
                    );
                  },
                  child: Text("Simpan Latihan"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
