import 'package:core_component/config/listImage/app_image.dart';
import 'package:core_component/routes/app_routes_named.dart';

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

class SettingList {
  final int id;
  final String icon;
  final String title;
  final String description;
  final String route;
  final int status;

  SettingList({
    required this.id,
    required this.icon,
    required this.title,
    required this.route,
    required this.description,
    required this.status,
  });
}

List<SettingList> settingData = [
  SettingList(
    id: 1,
    icon: AppIcon.iconPeople,
    title: "Profile settings",
    route: "",
    description: "Settings regarding your profile",
    status: 1,
  ),
  SettingList(
    id: 2,
    icon: AppIcon.iconNews,
    title: "News settings",
    route: "",
    description: "Choose your favourite topics",
    status: 1,
  ),
  SettingList(
    id: 3,
    icon: AppIcon.iconBell,
    title: "Notifications",
    description: "When would you like to be notified",
    route: "",
    status: 1,
  ),
  SettingList(
    id: 4,
    icon: AppIcon.iconFolder,
    title: "Subscriptions",
    route: "",
    description: "Currently, you are in Starter Plan",
    status: 1,
  ),
  SettingList(
    id: 5,
    icon: AppIcon.iconLogout,
    title: "Logout",
    route: AppRoutesNamed.pageStarted,
    description: "Safely signs out of the account",
    status: 1,
  ),
];

List<SettingList> settingOtherData = [
  SettingList(
    id: 4,
    icon: AppIcon.iconBug,
    title: "Bug report",
    route: "",
    description: "Report bugs very easy",
    status: 2,
  ),
  SettingList(
    id: 5,
    icon: AppIcon.iconShare,
    title: "Share the app",
    route: "",
    description: "Share on social media networks",
    status: 2,
  ),
];
