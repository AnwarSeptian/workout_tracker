import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:workout_tracker/constant/app_color.dart';

class PushupScreen extends StatefulWidget {
  const PushupScreen({super.key});

  @override
  State<PushupScreen> createState() => _PushupScreenState();
}

class _PushupScreenState extends State<PushupScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.hitam1,
        appBar: AppBar(
          title: Text("PUSH UP"),
          backgroundColor: AppColor.cream1,
        ),
        body: Column(
          children: [
            Image.asset('assets/images/pushup1.jpg'),
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
                      "Letakkan tangan di lantai, selebar bahu turunkan hingga dada hampir menyentuh lantai, lalu turunkan badan kearah bawah",
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
                      "Dorong tubuh kembali ke posisi awal dengan menekan telapak tangan ke lantai.",
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
                    Text("Ulangi hingga 10x "),
                    Text("Jika Sudah berhasil di lakukan simpan latihan"),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(onPressed: () {}, child: Text("Simpan Latihan")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
