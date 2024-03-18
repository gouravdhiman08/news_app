import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Controller/BottomNavigationController.dart';

class MyBottomNav extends StatelessWidget {
  const MyBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavBar controller = Get.put(BottomNavBar());

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            width: 180,
            height: 60,
            decoration: BoxDecoration(
                color: Colors.black,
                // color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(50)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => InkWell(
                        onTap: () {
                          controller.index.value = 0;
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 1000),
                          curve: Curves.bounceInOut,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: controller.index.value == 0
                                  ? Colors.amber
                                  : null,
                              borderRadius: BorderRadius.circular(26)),
                          child: Icon(
                            Icons.home,
                            size: 30,
                            color: controller.index.value == 0
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => InkWell(
                        onTap: () {
                          controller.index.value = 1;
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 1000),
                          curve: Curves.bounceInOut,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: controller.index.value == 1
                                  ? Colors.amber
                                  : null,
                              borderRadius: BorderRadius.circular(26)),
                          child: Icon(
                            Icons.book,
                            size: 30,
                            color: controller.index.value == 1
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Obx(() => InkWell(
                          onTap: () {
                            controller.index.value = 2;
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 1000),
                            curve: Curves.bounceInOut,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: controller.index.value == 2
                                    ? Colors.amber
                                    : null,
                                borderRadius: BorderRadius.circular(26)),
                            child: Icon(
                              Icons.settings,
                              size: 30,
                              color: controller.index.value == 2
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
