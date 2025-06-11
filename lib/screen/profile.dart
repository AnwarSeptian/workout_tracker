import 'package:flutter/material.dart';
import 'package:workout_tracker/constant/app_color.dart';
import 'package:workout_tracker/database/db_latihan.dart';
import 'package:workout_tracker/login_screen.dart';
import 'package:workout_tracker/model/latihan_model.dart';
import 'package:workout_tracker/screen/update_screen.dart';

class TugasDuaFlutter extends StatefulWidget {
  const TugasDuaFlutter({super.key});

  @override
  State<TugasDuaFlutter> createState() => _TugasDuaFlutterState();
}

class _TugasDuaFlutterState extends State<TugasDuaFlutter> {
  List<LatihanModel> historyLatihan = [];

  @override
  void initState() {
    super.initState();
    muatData();
  }

  Future<void> muatData() async {
    final data = await DbLatihan.getLatihanModel();

    print("📋 Jumlah data yang dimuat: ${data.length}");
    for (var item in data) {
      print("🔹 ${item.toMap()}");
    }
    setState(() {
      historyLatihan = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.hitam2,
      appBar: AppBar(
        title: Text(
          "Profil Anda",
          style: TextStyle(
            color: AppColor.hitam2,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.logout),
                Text("LOGOUT", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
        centerTitle: true,
        backgroundColor: AppColor.cream2,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            CircleAvatar(
              backgroundColor: AppColor.cream1,
              radius: 95,
              child: CircleAvatar(
                radius: 90,
                backgroundImage: AssetImage("assets/images/enzo.png"),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                "Enzo Fernandes",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: AppColor.putih,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              margin: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: historyLatihan.length,
                itemBuilder: (context, index) {
                  final latihan = historyLatihan[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(child: Text("${index + 1}")),
                              SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      latihan.namalatihan,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(latihan.tanggal),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Durasi: ${latihan.durasi} mnt",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    "${latihan.total} set",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => UpdateScreen(
                                            latihanModel: LatihanModel(
                                              id: latihan.id,
                                              durasi: latihan.durasi,
                                              total: latihan.total,
                                              tanggal: latihan.tanggal,
                                              namalatihan: latihan.namalatihan,
                                            ),
                                          ),
                                    ),
                                  ).then((value) => muatData());
                                },
                                child: Text("Edit"),
                              ),
                              TextButton(
                                onPressed: () async {
                                  await DbLatihan.deleteData(latihan.id!);
                                  setState(() {
                                    muatData();
                                  });
                                },
                                child: Text("Hapus"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
