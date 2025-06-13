import 'package:flutter/material.dart';
import 'package:workout_tracker/constant/app_color.dart';
import 'package:workout_tracker/screen/halaman_detail.dart';
import 'package:workout_tracker/screen/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String id = "home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> daftarLatihan = [
    {
      'title': "PUSH UP",
      'image': "assets/images/profiletraining.jpg",
      'image2': 'assets/images/pushup1.jpg',
      'deskripsi':
          "Letakkan tangan di lantai, selebar bahu turunkan hingga dada hampir menyentuh lantai, lalu turunkan badan kearah bawah",
      'deskripsi2':
          "Dorong tubuh kembali ke posisi awal dengan menekan telapak tangan ke lantai.",
    },
    {
      'title': "SIT UP",
      'image': "assets/images/profiletraining2.jpg",
      'image2': 'assets/images/situp1.jpg',
      'deskripsi':
          "Berbaring telentang di lantai dengan lutut ditekuk dan telapak kaki rata di lantai. Letakkan di belakang kepala (jangan tarik leher).",
      'deskripsi2':
          "Angkat tubuh bagian atas menuju lutut dengan mengontraksi otot perut. Turunkan kembali secara perlahan ke posisi awal.",
    },
    {
      'title': "PLANK",
      'image': "assets/images/profiletraining3.jpg",
      'image2': 'assets/images/plank1.jpg',
      'deskripsi':
          "Posisikan tubuh seperti push-up, tapi dengan siku menempel di lantai sejajar bahu.",
      'deskripsi2':
          "Jaga tubuh tetap lurus dari kepala hingga tumit. Tahan posisi ini selama 20–60 detik. ",
    },
    {
      'title': "LEG RAISES",
      'image': "assets/images/profiletraining4.jpg",
      'image2': 'assets/images/legraises.jpg',
      'deskripsi':
          "Berbaring telentang dengan kaki lurus dan tangan di samping tubuh.",
      'deskripsi2':
          "Angkat kedua kaki lurus ke atas hingga membentuk sudut 90°. Turunkan perlahan tanpa menyentuh lantai, lalu ulangi.",
    },
    {
      'title': "JUMP SQUAD",
      'image': "assets/images/profiletraining6.jpg",
      'image2': 'assets/images/jumpsquat.jpg',
      'deskripsi':
          "Berdiri tegak, kaki selebar bahu. Lakukan squat biasa hingga paha sejajar lantai.",
      'deskripsi2':
          "Lompat ke atas sekuat mungkin, lalu mendarat dengan lutut sedikit menekuk. Langsung masuk ke squat lagi dan ulangi.",
    },
    {
      'title': "HIGH KNEE SQUAD",
      'image': "assets/images/images.jpg",
      'image2': 'assets/images/highkneesquat.jpg',
      'deskripsi':
          "Berdiri tegak, kaki selebar pinggul. Turunkan badan kebawah",
      'deskripsi2':
          "Saat berdiri kembali, angkat satu lutut tinggi ke arah dada. Kembali ke posisi squat dan ulangi dengan lutut lainnya.",
    },
  ];

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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TugasDuaFlutter()),
                );
              },
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/enzo.png"),
              ),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        // physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              width: double.infinity,
              child: Image.asset(
                "assets/images/banner.jpeg",
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            SizedBox(height: 2),
            SizedBox(
              height: 150,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,

                child: Row(
                  children: [
                    Image.asset('assets/images/banner5.jpg'),
                    SizedBox(width: 2),
                    Image.asset('assets/images/splashscreen.jpg'),
                    SizedBox(width: 2),

                    Image.asset('assets/images/images.jpg'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12),
            Container(
              width: double.infinity,
              height: 60,
              color: AppColor.cream1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "CHOOSE YOUR TRAINING TODAY ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: AppColor.putih,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),

            GridView.builder(
              // padding: EdgeInsets.all(8),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: daftarLatihan.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 4,
                // childAspectRatio: 1,
              ),

              itemBuilder: (BuildContext context, int index) {
                final latihan = daftarLatihan[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => HalamanDetail(
                              jenis: latihan['title'],
                              image: latihan['image2'],
                              deskripsi: latihan['deskripsi'],
                              deskripsi2: latihan['deskripsi2'],
                            ),
                      ),
                    );
                  },
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.asset(
                          latihan['image'],
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          color: AppColor.cream1,
                        ),
                        height: 32,
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            latihan['title'],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColor.hitam2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
