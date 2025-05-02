import 'package:core_component/config/listImage/app_image.dart';
import 'package:core_component/models/news_model.dart';
import 'package:core_component/screen/news/news.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> imageUrls = [
    AppImage.imageCarousel,
    AppImage.imageCarousel,
    AppImage.imageCarousel,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "NewsApp",
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0), // padding luar
          child: IconButton(
            padding: EdgeInsets.zero, // hilangkan padding default
            constraints: BoxConstraints(), // hilangkan batas default ukuran
            icon: Image.asset(AppIcon.humberger, width: 40, height: 40),
            onPressed: () {
              print("hallo");
            },
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 30),
          SizedBox(
            height: 311, // tinggi tetap untuk ListView horizontal
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(width: 20);
              },
              itemCount: imageUrls.length,
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (context, index) {
                return Carousel(imageUrls: imageUrls, index: index);
              },
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Latest News",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/icons/arrow-forward-circle-outline.png",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListView.separated(
            itemCount: newData.length,
            padding: EdgeInsets.symmetric(horizontal: 20),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) {
              return SizedBox(height: 20); // Menambahkan jarak antar card
            },
            itemBuilder: (context, index) {
              return ListNews(index: index);
            },
          ),
        ],
      ),
    );
  }
}

class ListNews extends StatelessWidget {
  const ListNews({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => News()),
        );
      },
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(newData[index].image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "TECHNOLOGY",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                      color: Colors.grey,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      newData[index].title,
                      softWrap: true,
                      overflow: TextOverflow.clip,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ), // Teks akan dipotong dengan elipsis
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

class Carousel extends StatelessWidget {
  const Carousel({super.key, required this.imageUrls, required this.index});

  final List<String> imageUrls;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 311,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(imageUrls[index]),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "TECHNOLOGY",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w900,
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                Text(
                  "3 min ago",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Spacer(),
            Column(
              children: [
                Text(
                  "Microsoft launches a deepfake detector tool ahead of US election",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/icons/chatbubble-ellipses-outline.png",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/icons/bookmark-outline.png",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/icons/arrow-redo-outline.png",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
