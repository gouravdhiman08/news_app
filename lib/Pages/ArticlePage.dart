import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:news_app/Controller/NewsController.dart';
import 'package:news_app/Pages/NewsDetail.dart';
import 'package:news_app/Pages/Widgets/NewsForYou.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Article"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Search News",
                      prefixIcon: Icon(Icons.search),
                      fillColor: Theme.of(context).colorScheme.primaryContainer,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              )),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Obx(() {
                    if (newsController.news4you_sub.isEmpty) {
                      return CircularProgressIndicator();
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: newsController.news4you_sub.length,
                        itemBuilder: (context, index) {
                          var news = newsController.news4you_sub[index];
                          return NewsForYou(
                            ontapp: () {
                              Get.to(NewsDetailPage(
                                newsD: news,
                              ));
                            },
                            imageUrl: news.urlToImage ??
                                "https://duet-cdn.vox-cdn.com/thumbor/0x0:1100x733/750x500/filters:focal(550x367:551x368):format(webp)/cdn.vox-cdn.com/uploads/chorus_asset/file/25333573/PR_Header_EN_1_1440x733.jpg",
                            title: news.title ?? "BLANK",
                            author: news.author ?? "Gourav Dhiman",
                            time: news.publishedAt ?? "2020-01-01",
                            tag: "TEK NEWS",
                          );
                        },
                      );
                    }
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
