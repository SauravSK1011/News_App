import 'dart:convert';

import 'package:news_app/modal/artical_modal.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticalModel> news = [];
  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=7cf91b89d64840019abd37d59bff112f";
    var responce = await http.get(Uri.parse(url));
    var jsondata = jsonDecode(responce.body);
    if (jsondata["status"] == "ok") {
      jsondata["articles"].forEach((element) {
        if (element["title"] != null &&
            element["description"] != null &&
            element["urlToImage"] != null &&
            element["url"] != null) {
          ArticalModel articalmodel = ArticalModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            url: element["url"],
          );
          news.add(articalmodel);
        }
      });
    }
  }
}

class CategoryNewsClass {
  List<ArticalModel> news = [];
  Future<void> getNews(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=7cf91b89d64840019abd37d59bff112f";
    var responce = await http.get(Uri.parse(url));
    var jsondata = jsonDecode(responce.body);
    if (jsondata["status"] == "ok") {
      jsondata["articles"].forEach((element) {
        if (element["title"] != null &&
            element["description"] != null &&
            element["urlToImage"] != null &&
            element["url"] != null) {
          ArticalModel articalmodel = ArticalModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            url: element["url"],
          );
          news.add(articalmodel);
        }
      });
    }
  }
}
