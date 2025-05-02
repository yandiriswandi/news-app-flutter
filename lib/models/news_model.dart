import 'package:core_component/config/listImage/app_image.dart';

class NewsModel {
  final String image;
  final String category;
  final String title;

  NewsModel({required this.image, required this.category, required this.title});
}

List<NewsModel> newData = [
  NewsModel(
    image: AppImage.image,
    category: "Technology",
    title: "Insurtech startup PasarPolis gets \$54 million — Series B",
  ),
  NewsModel(
    image: AppImage.image,
    category: "Technology",
    title: "The IPO parade continues as Wish files, Bumble targets",
  ),
  NewsModel(
    image: AppImage.image,
    category: "Technology",
    title: "Hypatos gets \$11.8M for a deep learning approach",
  ),
];
