import 'package:flutter/material.dart';
import 'package:workout_tracker/constant/app_color.dart';

class SimpanLatihan extends StatefulWidget {
  const SimpanLatihan({super.key});

  @override
  State<SimpanLatihan> createState() => _SimpanLatihanState();
}

class _SimpanLatihanState extends State<SimpanLatihan> {
  String? selected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.hitam1,
      appBar: AppBar(
        backgroundColor: AppColor.cream2,
        centerTitle: true,
        title: Text("Simpan Latihan", style: TextStyle(color: AppColor.hitam2)),
      ),
      body: Column(
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
                        [
                          'PUSH UP',
                          'SIT UP',
                          'PLANK',
                          'LEG RAISES',
                          'JUMP SQUAD',
                          'HIGH KNEE SQUAD',
                        ].map((String val) {
                          return DropdownMenuItem(value: val, child: Text(val));
                        }).toList(),
                    onChanged: (val) {},
                  ),

                  SizedBox(height: 18),
                  TextFormField(
                    // controller: controller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    style: TextStyle(
                      color: AppColor.cream2,
                      fontWeight: FontWeight.normal,
                    ),
                    // obscureText: isPassword ? isVisibility : false,
                    decoration: InputDecoration(
                      hintText: "Durasi Latihan",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      // suffixIcon:
                      //     isPassword
                      //         ? IconButton(
                      //           onPressed: () {
                      //             setState(() {
                      //               isVisibility = !isVisibility;
                      //             });
                      //           },
                      //           icon: Icon(
                      //             isVisibility ? Icons.visibility_off : Icons.visibility,
                      //             color: AppColor.cream2,
                      //           ),
                      //         )
                      //         : null,
                    ),
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                    // controller: controller,
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
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      // suffixIcon:
                      //     isPassword
                      //         ? IconButton(
                      //           onPressed: () {
                      //             setState(() {
                      //               isVisibility = !isVisibility;
                      //             });
                      //           },
                      //           icon: Icon(
                      //             isVisibility ? Icons.visibility_off : Icons.visibility,
                      //             color: AppColor.cream2,
                      //           ),
                      //         )
                      //         : null,
                    ),
                  ),
                  SizedBox(height: 14),
                  ElevatedButton(onPressed: () {}, child: Text("Input Data")),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
