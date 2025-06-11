import 'package:flutter/material.dart';
import 'package:workout_tracker/constant/app_color.dart';
import 'package:workout_tracker/simpan_latihan.dart';

class JumpsquadScreen extends StatefulWidget {
  const JumpsquadScreen({super.key});

  @override
  State<JumpsquadScreen> createState() => _JumpsquadScreenState();
}

class _JumpsquadScreenState extends State<JumpsquadScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.hitam1,
        appBar: AppBar(
          title: Text("JUMP SQUAD"),
          backgroundColor: AppColor.cream1,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/jumpsquat.jpg'),
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
                        "Berdiri tegak, kaki selebar bahu. Lakukan squat biasa hingga paha sejajar lantai.",
                      ),
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
                        "Lompat ke atas sekuat mungkin, lalu mendarat dengan lutut sedikit menekuk. Langsung masuk ke squat lagi dan ulangi.",
                      ),
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
                        MaterialPageRoute(
                          builder: (context) => SimpanLatihan(),
                        ),
                      );
                    },
                    child: Text("Simpan Latihan"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
