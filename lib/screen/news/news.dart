import 'package:core_component/config/listImage/app_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      body: SafeArea(
        child: ListView(
          children: [
            HeaderContainer(),
            Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(AppImage.avatar, width: 40, height: 40),
                      SizedBox(width: 20),
                      Text(
                        "Yandi Riswandi",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          // fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Text(
                    "TECHNOLOGY",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "To build responsibly, tech needs to do more than just hire chief ethics officers",
                    softWrap: true,
                    overflow: TextOverflow.clip,
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                    ), // Teks akan dipotong dengan elipsis
                  ),
                  SizedBox(height: 10),
                  Text(
                    "17 June, 2023 — 4:49 PM",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      // fontWeight: FontWeight.w900,
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    width: double.infinity, // Panjang penuh
                    height: 1, // Ketebalan garis
                    color: Colors.grey, // Warna garis
                  ),
                  Text(
                    "In the last couple of years, we’ve seen new teams in tech companies emerge that focus on responsible innovation, digital well-being, AI ethics or humane use. Whatever their titles, these individuals are given the task of “leading” ethics at their companies.",
                    softWrap: true,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.375, // spasi antar baris
                    ),
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

class HeaderContainer extends StatelessWidget {
  const HeaderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 375,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImage.bgNews),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.topLeft,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context); // Kembali ke halaman sebelumnya
            },
            child: Image.asset(AppIcon.iconBackButton, width: 40, height: 40),
          ),
        ),
      ),
    );
  }
}
