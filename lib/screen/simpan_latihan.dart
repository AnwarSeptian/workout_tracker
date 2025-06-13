import 'package:flutter/material.dart';
import 'package:workout_tracker/constant/app_color.dart';
import 'package:workout_tracker/database/db_latihan.dart';
import 'package:workout_tracker/model/latihan_model.dart';

class SimpanLatihan extends StatefulWidget {
  const SimpanLatihan({super.key});

  @override
  State<SimpanLatihan> createState() => _SimpanLatihanState();
}

class _SimpanLatihanState extends State<SimpanLatihan> {
  final List<String> _jenislatihan = [
    'PUSH UP',
    'SIT UP',
    'PLANK',
    'LEG RAISES',
    'JUMP SQUAD',
    'HIGH KNEE SQUAD',
  ];

  String? selected;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController durasilatihanController = TextEditingController();
  final TextEditingController totalLatihanController = TextEditingController();
  final TextEditingController tanggalController = TextEditingController();

  List<LatihanModel> historyLatihan = [];

  @override
  void initState() {
    super.initState();
    muatData();
  }

  Future<void> muatData() async {
    final data = await DbLatihan.getLatihanModel();
    setState(() {
      historyLatihan = data;
    });
  }

  Future<void> simpanData() async {
    if (_formkey.currentState!.validate()) {
      final namalatihan = selected;
      final tanggal = tanggalController.text;
      final durasi = int.tryParse(durasilatihanController.text) ?? 0;
      final total = int.tryParse(totalLatihanController.text) ?? 0;

      if (selected != null && tanggal.isNotEmpty && durasi > 0 && total > 0) {
        await DbLatihan.insertLatihan(
          LatihanModel(
            namalatihan: selected!,
            durasi: durasi,
            total: total,
            tanggal: tanggal,
          ),
        );
        selected = null;
        durasilatihanController.clear();
        totalLatihanController.clear();
        tanggalController.clear();
        muatData();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.hitam1,
      appBar: AppBar(
        backgroundColor: AppColor.cream2,
        centerTitle: true,
        title: Text("Simpan Latihan", style: TextStyle(color: AppColor.hitam2)),
      ),
      body: Form(
        key: _formkey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.cream2,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Column(
                  children: [
                    Text(
                      "Input Hasil Latihan",
                      style: TextStyle(fontSize: 18, color: AppColor.hitam1),
                    ),
                    Divider(thickness: 4, color: AppColor.hitam1),
                    DropdownButton(
                      value: selected,
                      hint: Text("Jenis Latihan"),
                      items:
                          _jenislatihan.map((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selected = value!;
                        });
                      },
                    ),

                    SizedBox(height: 18),
                    TextFormField(
                      controller: durasilatihanController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      style: TextStyle(
                        color: AppColor.hitam1,
                        fontWeight: FontWeight.normal,
                      ),
                      decoration: InputDecoration(
                        hintText: "Durasi Latihan",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      controller: totalLatihanController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      style: TextStyle(
                        color: AppColor.hitam1,
                        fontWeight: FontWeight.normal,
                      ),
                      // obscureText: isPassword ? isVisibility : false,
                      decoration: InputDecoration(
                        hintText: "Total Set",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 14),
                    TextFormField(
                      controller: tanggalController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      style: TextStyle(
                        color: AppColor.hitam1,
                        fontWeight: FontWeight.normal,
                      ),
                      // obscureText: isPassword ? isVisibility : false,
                      decoration: InputDecoration(
                        hintText: "Tanggal Latihan",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 14),
                    ElevatedButton(
                      onPressed: () {
                        simpanData();
                      },
                      child: Text("Input Data"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
