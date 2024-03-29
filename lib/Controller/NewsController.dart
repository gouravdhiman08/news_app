import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/Model/NewsModel.dart';

class NewsController extends GetxController {
  RxList<NewsModel> trendingNewsList = <NewsModel>[].obs;
  RxList<NewsModel> news4you = <NewsModel>[].obs;
  RxList<NewsModel> news4you_sub = <NewsModel>[].obs;
  RxBool isSpeaking = false.obs;
  FlutterTts flutterTts = FlutterTts();


  @override
  void onInit() async {
    super.onInit();
    getTrendingNews();
    getNews4you();
    await getNews4you_sub(); // Call getNews4you_sub method
    WidgetsBinding.instance!.addObserver(AppLifecycleListener());

  }


 @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(AppLifecycleListener());
    super.dispose();
  }

 @override
  void didPopRoute() {
    stop(); // Stop audio when back button is pressed
  }

  Future<void> getTrendingNews() async {
    var baseURL =
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=993793a7502b4609aa1dcadee12ea164";

    try {
      var response = await http.get(Uri.parse(baseURL));
      print(response);
      if (response.statusCode == 200) {
        print(response.body);
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        for (var news in articles) {
          trendingNewsList.add(NewsModel.fromJson(news));
        }
      } else {
        print("Something Went Wrong");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getNews4you() async {
    var baseURL =
        "https://newsapi.org/v2/everything?q=apple&from=2024-03-21&to=2024-03-21&sortBy=popularity&apiKey=993793a7502b4609aa1dcadee12ea164";
    try {
      var response = await http.get(Uri.parse(baseURL));
      print(response);
      if (response.statusCode == 200) {
        print(response.body);
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        for (var news in articles) {
          news4you.add(NewsModel.fromJson(news));
        }
        news4you.value = news4you.sublist(0, 16).obs;
      } else {
        print("Something Went Wrong");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getNews4you_sub() async {
    var baseURL =
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=993793a7502b4609aa1dcadee12ea164";
    try {
      var response = await http.get(Uri.parse(baseURL));
      print(response);
      if (response.statusCode == 200) {
        print(response.body);
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        for (var news in articles) {
          news4you_sub.add(NewsModel.fromJson(news));
        }
        news4you_sub.value = news4you.sublist(0, 9).obs;
      } else {
        print("Something Went Wrong");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> speak(String text) async {
    isSpeaking.value = true;
    await flutterTts.setLanguage("en-US");
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
    await flutterTts.setVolume(1.0);

    // isSpeaking.value = false;

    flutterTts.setCompletionHandler(() {
    isSpeaking.value = false;
  });
  }

  void stop() async{
    await flutterTts.stop();
    isSpeaking.value = false;
  }
}