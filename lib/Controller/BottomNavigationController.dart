import 'package:get/get.dart';
import 'package:news_app/Pages/ArticlePage.dart';
import 'package:news_app/Pages/HomePage.dart';
import 'package:news_app/Pages/ProfilePage.dart';

class BottomNavBar extends GetxController {
  RxInt index = 0.obs;

  var pages = [
    HomePage(),
    ArticlePage(),
    ProfilePage(),
  ];
}
