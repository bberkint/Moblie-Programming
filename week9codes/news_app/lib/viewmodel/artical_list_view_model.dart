import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/viewmodel/article_view_model.dart';

enum Status {
  empty(1),
  loading(2),
  received(3);

  const Status(this.value);
  final int value;
}

class ArticleListViewModel extends ChangeNotifier {
  ArticleViewModel articleViewModel =
      ArticleViewModel(category: "general", articles: []);
  Status status = Status.empty;

  ArticleListViewModel() {
    //Bütün haberleri çek
    getNews("general");
  }

  Future<void> getNews(String category) async {
    status = Status.loading;
    notifyListeners();
    articleViewModel.articles = await NewsService().getNewsByCategory(category);
    status = Status.received;
    notifyListeners();
  }
}
