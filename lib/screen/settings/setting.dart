import 'package:core_component/config/listImage/app_image.dart';
import 'package:core_component/models/news_model.dart';
import 'package:core_component/screen/auth/getstarted/getStarted.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: IconButton(
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            icon: Image.asset(AppIcon.iconHumberger, width: 40, height: 40),
            onPressed: () {
              print("hallo");
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                print("gambar kanan ditekan");
              },
              child: Image.asset(
                AppIcon.iconSearch, // ganti dengan path ikon kamu
                width: 36,
                height: 36,
              ),
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                Text(
                  "Settings",
                  style: GoogleFonts.poppins(
                    fontSize: 36,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 10),
                ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10);
                  },
                  shrinkWrap: true,
                  itemCount: settingData.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListSetting(
                      icon: settingData[index].icon,
                      title: settingData[index].title,
                      description: settingData[index].description,
                    );
                  },
                ),
                SizedBox(height: 20),
                Text("Other", style: GoogleFonts.poppins(fontSize: 26)),
                SizedBox(height: 10),
                ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10);
                  },
                  shrinkWrap: true,
                  itemCount: settingOtherData.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListSetting(
                      icon: settingOtherData[index].icon,
                      title: settingOtherData[index].title,
                      description: settingOtherData[index].description,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListSetting extends StatelessWidget {
  const ListSetting({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  final String icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: GoogleFonts.poppins()),
      subtitle: Text(
        description,
        style: GoogleFonts.poppins(color: Colors.grey),
      ),
      leading: Container(
        width: 54,
        height: 54,
        decoration: BoxDecoration(
          // image: DecorationImage(image: AssetImage(icon)),
          color: Color(0xff141e2814), // warna HEX, contoh: biru
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: Image.asset(icon, width: 22, height: 22)),
      ),
      trailing: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Image.asset(
          AppIcon.iconArrowForwardCircle, // Ganti dengan path gambar kamu
          width: 16,
          height: 16,
        ),
      ),
    );
  }
}
