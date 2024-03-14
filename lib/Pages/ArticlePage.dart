import 'package:flutter/material.dart';
import 'package:news_app/Pages/Widgets/NewsForYou.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  NewsForYou(
                      imageUrl:
                          "https://duet-cdn.vox-cdn.com/thumbor/0x0:2040x1360/750x500/filters:focal(1020x680:1021x681):format(webp)/cdn.vox-cdn.com/uploads/chorus_asset/file/23986648/acastro_STK086_03.jpg",
                      title:
                          "Tesla’s going back to court over Autopilot’s role in a deadly 2018 crash",
                      time: "12-Mar-2024",
                      author: "Gourav Dhiman"),
                  NewsForYou(
                      imageUrl:
                          "https://duet-cdn.vox-cdn.com/thumbor/0x0:2040x1360/750x500/filters:focal(1020x680:1021x681):format(webp)/cdn.vox-cdn.com/uploads/chorus_asset/file/23985721/acastro_STK062_01.jpg",
                      title:
                          "Discord opens up to games and apps embedded in its chat app",
                      time: "Mar 12, 2024,",
                      author: "Gourav Dhiman"),
                  NewsForYou(
                      imageUrl:
                          "https://duet-cdn.vox-cdn.com/thumbor/0x0:3000x2000/750x500/filters:focal(1500x1000:1501x1001):format(webp)/cdn.vox-cdn.com/uploads/chorus_asset/file/23925967/acastro_STK045_02.jpg",
                      title:
                          "Apple to allow iOS app downloads direct from websites in the EU",
                      time: "Mar 12, 2024,",
                      author: "Gourav Dhiman"),
                  NewsForYou(
                      imageUrl:
                          "https://duet-cdn.vox-cdn.com/thumbor/0x0:2040x1360/750x500/filters:focal(1020x680:1021x681):format(webp)/cdn.vox-cdn.com/uploads/chorus_asset/file/23985721/acastro_STK062_01.jpg",
                      title:
                          "Discord opens up to games and apps embedded in its chat app",
                      time: "Mar 12, 2024,",
                      author: "Gourav Dhiman"),
                  NewsForYou(
                      imageUrl:
                          "https://duet-cdn.vox-cdn.com/thumbor/0x0:3000x2000/750x500/filters:focal(1500x1000:1501x1001):format(webp)/cdn.vox-cdn.com/uploads/chorus_asset/file/23925967/acastro_STK045_02.jpg",
                      title:
                          "Apple to allow iOS app downloads direct from websites in the EU",
                      time: "Mar 12, 2024,",
                      author: "Gourav Dhiman")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
