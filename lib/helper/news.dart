import 'dart:convert';

import 'package:flutterNews/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        'https://newsapi.org/v2/everything?q=covid&apiKey=30bfeba854ea4df3b13d14b083c40f11';

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element){
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            description: element['description'],
            author: element['author'],
            url: element['url'],
            urltoimage: element['urlToImage'],
            content: element['content']
          );

          news.add(articleModel);
        }
        
      });
    }
  }
}

class NewsCat {
  List<ArticleModel> news = [];

  Future<void> getNewscategory(String category) async {
    String url =
        // 'https://newsapi.org/v2/everything?q=porn&apiKey=30bfeba854ea4df3b13d14b083c40f11';
        "http://newsapi.org/v2/everything?q=$category&apiKey=30bfeba854ea4df3b13d14b083c40f11";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element){
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            description: element['description'],
            author: element['author'],
            url: element['url'],
            urltoimage: element['urlToImage'],
            content: element['content']
          );

          news.add(articleModel);
        }
        
      });
    }
  }
}
