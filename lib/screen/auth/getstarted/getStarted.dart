import 'package:core_component/config/color/color.dart';
import 'package:core_component/config/custom/custom_button.dart';
import 'package:core_component/routes/app_routes_named.dart';
import 'package:core_component/screen/auth/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PageGetStarted extends StatelessWidget {
  const PageGetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(right: 30, left: 30),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 330,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/imageStarted.png"),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Yuk, Membaca Bersama\n Sanber News",
                style: GoogleFonts.arimo(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                "Berita Terpercaya, Di Ujung Jari Anda",
                style: GoogleFonts.roboto(),
                textAlign: TextAlign.center,
              ),
              Spacer(),
              CustomButton(
                text: "Masuk",
                onPressed: () {
                  Get.toNamed(AppRoutesNamed.pageLogin);
                },
              ),
              SizedBox(height: 10),
              CustomButton(
                text: "Daftar",
                onPressed: () {
                  Get.toNamed(AppRoutesNamed.pageRegister);
                },
                backgroundColor: Colors.white,
                textColor: AppColor.primaryColor,
                side: BorderSide(color: AppColor.primaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
