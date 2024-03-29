import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/Controller/NewsController.dart';
import 'package:news_app/Model/NewsModel.dart';

class NewsDetailPage extends StatelessWidget {
  final NewsModel newsD;
  const NewsDetailPage({
    Key? key,
    required this.newsD,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    return WillPopScope(
      onWillPop: () async {
        // Stop TTS when using the phone's back button
        Get.find<NewsController>().stop();
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          // Stop TTS and navigate back
                          Get.find<NewsController>().stop();
                          Get.back();
                        },
                        child: Container(
                          child: const Row(
                            children: [
                              Icon(Icons.arrow_back_ios_new),
                              Text("Back"),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              newsD.urlToImage ??
                                  "https://duet-cdn.vox-cdn.com/thumbor/0x0:2040x1360/750x500/filters:focal(1020x680:1021x681):format(webp)/cdn.vox-cdn.com/uploads/chorus_asset/file/23262657/VRG_Illo_STK001_B_Sala_Hacker.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    newsD.title!,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Text(
                        newsD.publishedAt!,
                        style: Theme.of(context).textTheme.caption,
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage('assets/images/image.png'),
                        child: Text(
                          "",
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        newsD.author ?? "Gourav Dhiman",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Obx(
                          () => newsController.isSpeaking.value
                              ? IconButton(
                                  onPressed: () {
                                    newsController.stop();
                                  },
                                  icon: Icon(
                                    Icons.stop,
                                    size: 50,
                                  ),
                                )
                              : IconButton(
                                  onPressed: () {
                                    newsController.speak(
                                        newsD.description ?? "No Description");
                                  },
                                  icon: Icon(
                                    Icons.play_arrow_rounded,
                                    size: 50,
                                  ),
                                ),
                        ),
                        Expanded(
                          child: Obx(
                            () => Lottie.asset(
                              'assets/animation/wave.json',
                              height: 70,
                              animate: newsController.isSpeaking.value,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          newsD.description!,
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
