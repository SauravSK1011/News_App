import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/modal/artical_modal.dart';
import 'package:http/http.dart' as http;

// geeting() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await FlutterConfig.loadEnvVariables();
//   late String apiKey = FlutterConfig.get("API_KEY");
// }

class News {
  List<ArticalModel> news = [];
  Future<void> getNews() async {
    // geeting();
    String? apiKey = dotenv.env["API_KEY"];

    String url =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=$apiKey";
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
    // geeting();
    String? apiKey = dotenv.env["API_KEY"];

    String url =
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=$apiKey";
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

class Search {
  List<ArticalModel> search = [];
  Future<void> getNews(String query) async {
    // geeting();
    String? apiKey = dotenv.env["API_KEY"];

    String url =
        "https://newsapi.org/v2/top-headlines?q=$query&sortBy=publishedAt&apiKey=$apiKey";
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
          search.add(articalmodel);
        }
      });
    }
  }
}

class Withlink {
  List<ArticalModel> withlink = [];
  Future<void> getNews(String query) async {
    // geeting();
    String? apiKey = dotenv.env["API_KEY"];

    String url = query + "$apiKey";
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
          withlink.add(articalmodel);
        }
      });
    }
  }
}
