import 'package:flutter/material.dart';
import 'package:workout_tracker/constant/app_color.dart';
import 'package:workout_tracker/database/db_latihan.dart';
import 'package:workout_tracker/model/latihan_model.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key, required this.latihanModel});
  final LatihanModel latihanModel;
  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final List<String> _jenislatihan = [
    'PUSH UP',
    'SIT UP',
    'PLANK',
    'LEG RAISES',
    'JUMP SQUAD',
    'HIGH KNEE SQUAD',
  ];

  final _formkey = GlobalKey<FormState>();
  late TextEditingController durasilatihanController = TextEditingController();
  late TextEditingController totalLatihanController = TextEditingController();
  late TextEditingController tanggalController = TextEditingController();
  String? selected;

  List<LatihanModel> historyLatihan = [];

  @override
  void initState() {
    selected = widget.latihanModel.namalatihan;
    durasilatihanController = TextEditingController(
      text: widget.latihanModel.durasi.toString(),
    );
    totalLatihanController = TextEditingController(
      text: widget.latihanModel.total.toString(),
    );
    tanggalController = TextEditingController(
      text: widget.latihanModel.tanggal,
    );
    super.initState();
  }

  void update() async {
    final updated = LatihanModel(
      id: widget.latihanModel.id,
      namalatihan: selected ?? widget.latihanModel.namalatihan,
      tanggal: tanggalController.text,
      durasi: int.parse(durasilatihanController.text),
      total: int.parse(totalLatihanController.text),
    );
    print(updated.toJson());
    await DbLatihan.updateData(updated);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.hitam1,
      appBar: AppBar(
        backgroundColor: AppColor.cream2,
        centerTitle: true,
        title: Text("UPDATE LATIHAN", style: TextStyle(color: AppColor.hitam2)),
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
                      onPressed: update,
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
