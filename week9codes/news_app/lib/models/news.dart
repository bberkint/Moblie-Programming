import 'package:news_app/models/article.dart';
import 'package:news_app/models/source.dart';

class News {
  String? status;
  int? totalResults;
  List<Article>? articles;
  News({
    this.status,
    this.totalResults,
    this.articles,
  });

  News.fromJSON(Map<String, dynamic> json) {
    status = json["status"];
    totalResults = json["totalResults"];

    if (json["articles"] != null) {
      articles = <Article>[]; // Article nesnelerini tutacak boş bir liste
      json["articles"].forEach((articleJson) {
        articles!.add(Article.fromJSON(articleJson));
      });
    }
  }

  Map<String, dynamic> toJSON() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data["status"] = this.status;
    data["totalResults"] = this.totalResults;
    if (articles != null) {
      data["articles"] = articles!.map((article) => article.toJSON()).toList();
    }

    return data;
  }
}
