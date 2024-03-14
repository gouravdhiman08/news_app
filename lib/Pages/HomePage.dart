import 'package:flutter/material.dart';
import 'package:news_app/Pages/Widgets/HotNews.dart';
import 'package:news_app/Pages/Widgets/NewsForYou.dart';
import 'package:news_app/Components/MyBottomNav.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "TEK NEWS",
            style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),
          )),
      floatingActionButton: MyBottomNav(),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hot News",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    "See All News",
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Hotnews(
                      imageUrl:
                          "https://duet-cdn.vox-cdn.com/thumbor/0x0:2040x1360/750x500/filters:focal(1020x680:1021x681):format(webp)/cdn.vox-cdn.com/uploads/chorus_asset/file/23262657/VRG_Illo_STK001_B_Sala_Hacker.jpg",
                      title:
                          "Midjourney bans all Stability AI employees over alleged data scraping",
                      author: "Gourav Dhiman",
                      time: "2020-01-01",
                      tag: "trending 1",
                    ),
                    Hotnews(
                      imageUrl:
                          "https://duet-cdn.vox-cdn.com/thumbor/0x0:2040x1360/750x500/filters:focal(1020x680:1021x681):format(webp)/cdn.vox-cdn.com/uploads/chorus_asset/file/23262657/VRG_Illo_STK001_B_Sala_Hacker.jpg",
                      title:
                          "Midjourney bans all Stability AI employees over alleged data scraping",
                      author: "Gourav Dhiman",
                      time: "2020-01-01",
                      tag: "trending 1",
                    ),
                    Hotnews(
                      imageUrl:
                          "https://duet-cdn.vox-cdn.com/thumbor/0x0:2040x1360/750x500/filters:focal(1020x680:1021x681):format(webp)/cdn.vox-cdn.com/uploads/chorus_asset/file/23262657/VRG_Illo_STK001_B_Sala_Hacker.jpg",
                      title:
                          "Midjourney bans all Stability AI employees over alleged data scraping",
                      author: "Gourav Dhiman",
                      time: "2020-01-01",
                      tag: "trending 1",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "News for you",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    "See All News",
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
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
                      author: "Gourav Dhiman")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
