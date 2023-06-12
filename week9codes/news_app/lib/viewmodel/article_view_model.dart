import 'package:news_app/models/article.dart';

class ArticleViewModel {
  String category;
  List<Article> articles;
  ArticleViewModel({required this.category, required this.articles});
}
