import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/Model/NewsModel.dart';

class NewsController extends GetxController {
  RxList<NewsModel> trendingNewsList = <NewsModel>[].obs;
  RxList<NewsModel> news4you = <NewsModel>[].obs;
  @override
  void onInit() async {
    super.onInit();
    getTrendingNews();
    getNews4you();
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
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=993793a7502b4609aa1dcadee12ea164";
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
        news4you.value = news4you.sublist(0, 6).obs;
      } else {
        print("Something Went Wrong");
      }
    } catch (e) {
      print(e);
    }
  }
}
