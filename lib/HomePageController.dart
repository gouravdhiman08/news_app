import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Components/MyBottomNav.dart';
import 'package:news_app/Controller/BottomNavigationController.dart';

class HomePageController extends StatelessWidget {
  const HomePageController({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavBar controller = Get.put(BottomNavBar());
    return Scaffold(
      floatingActionButton: MyBottomNav(),
      body: Obx(() => controller.pages[controller.index.value]),
    );
  }
}
