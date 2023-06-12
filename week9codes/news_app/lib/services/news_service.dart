import 'dart:convert';

import 'package:news_app/models/article.dart';
import 'package:http/http.dart' as http;

import '../models/news.dart';

class NewsService {
  Future<List<Article>> getNewsByCategory(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=f4ff817697034fb1817920f3cfdc69d5";

    Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      // Veriyi düzgün bir şekildeçektim
      final bodyJSON = json.decode(response.body);
      News news = News.fromJSON(bodyJSON);
      return news.articles ?? [];
    }

    throw Exception("Internal Server Error");
  }
}
