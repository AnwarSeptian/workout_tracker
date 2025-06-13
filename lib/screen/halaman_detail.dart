// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:workout_tracker/constant/app_color.dart';
import 'package:workout_tracker/screen/simpan_latihan.dart';

class HalamanDetail extends StatefulWidget {
  final String? jenis;
  final String? deskripsi;
  final String? deskripsi2;
  final String? image;
  const HalamanDetail({
    super.key,
    required this.jenis,
    required this.deskripsi,
    required this.deskripsi2,
    required this.image,
  });

  @override
  State<HalamanDetail> createState() => _HalamanDetailState();
}

class _HalamanDetailState extends State<HalamanDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.hitam1,
        appBar: AppBar(
          title: Text(widget.jenis ?? ""),
          backgroundColor: AppColor.cream1,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(widget.image ?? ""),
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
                      Text(widget.deskripsi ?? ""),
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
                      Text(widget.deskripsi2!),
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
