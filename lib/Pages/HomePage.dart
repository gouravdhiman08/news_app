// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:news_app/Controller/NewsController.dart';
// import 'package:news_app/Pages/NewsDetail.dart';
// import 'package:news_app/Pages/Widgets/HotNews.dart';
// import 'package:news_app/Pages/Widgets/NewsForYou.dart';
// import 'package:news_app/Components/MyBottomNav.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     NewsController newsController = Get.put(NewsController());

//     return Scaffold(
//       appBar: AppBar(
//           backgroundColor: Colors.black,
//           title: Text(
//             "TEK NEWS",
//             style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),
//           )),

//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Hot News",
//                     style: Theme.of(context).textTheme.headlineMedium,
//                   ),
//                   Text(
//                     "See All News",
//                     style: Theme.of(context).textTheme.labelSmall,
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Obx(() {
//                 if (newsController.trendingNewsList.isEmpty) {
//                   return CircularProgressIndicator(); // Show loading indicator while data is being fetched
//                 } else {
//                   return SizedBox(
//                     height: 376, // Adjust height as needed
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: newsController.trendingNewsList.length,
//                       itemBuilder: (context, index) {
//                         var news = newsController.trendingNewsList[index];
//                         return Hotnews(
//                           ontap: () {
//                             Get.to(NewsDetailPage());
//                           },
//                           imageUrl: news.urlToImage!,
//                           title: news.title!,
//                           author: news.author ?? "Gourav Dhiman",
//                           time: news.publishedAt ?? "2020-01-01",
//                           tag: "TEK NEWS",
//                         );
//                       },
//                     ),
//                   );
//                 }
//               }),
//               SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "News for you",
//                     style: Theme.of(context).textTheme.headlineMedium,
//                   ),
//                   Text(
//                     "See All News",
//                     style: Theme.of(context).textTheme.labelSmall,
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Obx(() {
//                 if (newsController.news4you.isEmpty) {
//                   return CircularProgressIndicator(); // Show loading indicator while data is being fetched
//                 } else {
//                   return ListView.builder(
//                     scrollDirection: Axis.vertical,
//                     itemCount: newsController.news4you.length,
//                     itemBuilder: (context, index) {
//                       var news = newsController.news4you[index];
//                       return NewsForYou(
//                         imageUrl: news.urlToImage ?? "https://duet-cdn.vox-cdn.com/thumbor/0x0:1100x733/750x500/filters:focal(550x367:551x368):format(webp)/cdn.vox-cdn.com/uploads/chorus_asset/file/25333573/PR_Header_EN_1_1440x733.jpg",
//                         title: news.title ?? "BLANK",
//                         author: news.author ?? "Gourav Dhiman",
//                         time: news.publishedAt ?? "2020-01-01",
//                       );
//                     },
//                   );
//                 }
//               }),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Controller/NewsController.dart';
import 'package:news_app/Pages/NewsDetail.dart';
import 'package:news_app/Pages/Widgets/HotNews.dart';
import 'package:news_app/Pages/Widgets/NewsForYou.dart';
import 'package:news_app/Components/MyBottomNav.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "TEK NEWS",
          style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Trending News",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(
                  height: 20,
                ),
                Obx(() {
                  if (newsController.trendingNewsList.isEmpty) {
                    return CircularProgressIndicator();
                  } else {
                    return SizedBox(
                      height: 376,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: newsController.trendingNewsList.length,
                        itemBuilder: (context, index) {
                          var news = newsController.trendingNewsList[index];
                          return Hotnews(
                            ontap: () {
                              Get.to(NewsDetailPage(
                                newsD: news,
                              ));
                            },
                            imageUrl: news.urlToImage ??
                                "https://duet-cdn.vox-cdn.com/thumbor/0x0:1100x733/750x500/filters:focal(550x367:551x368):format(webp)/cdn.vox-cdn.com/uploads/chorus_asset/file/25333573/PR_Header_EN_1_1440x733.jpg",
                            title: news.title!,
                            author: news.author ?? "Gourav Dhiman",
                            time: news.publishedAt ?? "2020-01-01",
                            tag: "TEK NEWS",
                          );
                        },
                      ),
                    );
                  }
                }),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "News for you",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(
                  height: 10,
                ),
                Obx(() {
                  if (newsController.news4you.isEmpty) {
                    return CircularProgressIndicator();
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: newsController.news4you.length,
                      itemBuilder: (context, index) {
                        var news = newsController.news4you[index];
                        return NewsForYou(
                          imageUrl: news.urlToImage ??
                              "https://duet-cdn.vox-cdn.com/thumbor/0x0:1100x733/750x500/filters:focal(550x367:551x368):format(webp)/cdn.vox-cdn.com/uploads/chorus_asset/file/25333573/PR_Header_EN_1_1440x733.jpg",
                          title: news.title ?? "BLANK",
                          author: news.author ?? "Gourav Dhiman",
                          time: news.publishedAt ?? "2020-01-01",
                        );
                      },
                    );
                  }
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
