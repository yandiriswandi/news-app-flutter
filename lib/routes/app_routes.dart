import 'package:core_component/main.dart';
import 'package:core_component/routes/app_routes_named.dart';
import 'package:core_component/screen/auth/getstarted/getStarted.dart';
import 'package:core_component/screen/auth/login/login.dart';
import 'package:core_component/screen/auth/register/register.dart';
import 'package:core_component/screen/home/home.dart';
import 'package:core_component/screen/news/news.dart';
import 'package:core_component/screen/settings/setting.dart';
import 'package:get/route_manager.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: AppRoutesNamed.pageMain, page: () => MainScreen()),
    GetPage(name: AppRoutesNamed.pageHome, page: () => PageHome()),
    GetPage(name: AppRoutesNamed.pageNews, page: () => PageNews()),
    GetPage(name: AppRoutesNamed.pageStarted, page: () => PageGetStarted()),
    GetPage(name: AppRoutesNamed.pageLogin, page: () => PageLogin()),
    GetPage(name: AppRoutesNamed.pageRegister, page: () => PageRegister()),
    GetPage(name: AppRoutesNamed.pageSetting, page: () => PageSetting()),
  ];
}
