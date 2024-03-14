import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Model/NewsModel.dart';

class NewsDetailPage extends StatelessWidget {
  final NewsModel newsD;
  const NewsDetailPage({super.key, required this.newsD});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    // color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            newsD.urlToImage!,
                            // "https://duet-cdn.vox-cdn.com/thumbor/0x0:2040x1360/750x500/filters:focal(1020x680:1021x681):format(webp)/cdn.vox-cdn.com/uploads/chorus_asset/file/23262657/VRG_Illo_STK001_B_Sala_Hacker.jpg",
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
                  // "Midjourney bans all Stability AI employees over alleged data scraping",
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
                      // "2-March-2024",
                      style: Theme.of(context).textTheme.labelSmall,
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.purple,
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
                      newsD.author!,
                      // "Gourav Dhiman",
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
                  // height: 30,
                  child: Row(
                    children: [
                      // Obx(
                      //   () => newsController.isSpeeking.value
                      //       ? IconButton(
                      //           onPressed: () {
                      //             newsController.stop();
                      //           },
                      //           icon: Icon(
                      //             Icons.stop,
                      //             size: 50,
                      //           ),
                      //         )
                      //       : IconButton(
                      //           onPressed: () {
                      //             newsController.speak(
                      //                 news.description ?? "No Description");
                      //           },
                      //           icon: Icon(
                      //             Icons.play_arrow_rounded,
                      //             size: 50,
                      //           ),
                      //         ),
                      // ),
                      // Expanded(
                      //     child: Obx(
                      //   () => Lottie.asset(
                      //     'Assets/Animation/wave.json',
                      //     height: 70,
                      //     animate: newsController.isSpeeking.value,
                      //   ),
                      // ))
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        newsD.description!,
                        // "Midjourney says it has banned Stability AI staffers from using its service, accusing employees at the rival generative AI company of causing a systems outage earlier this month during an attempt to scrape Midjourney’s data.Midjourney posted an update to its Discord server on March 2nd that acknowledged an extended server outage was preventing generated images from appearing in user galleries. In a summary of a business update call on March 6th, Midjourney claimed that “botnet-like activity from paid accounts” — which the company specifically links to Stability AI employees — was behind the outage.",
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
    );
  }
}
