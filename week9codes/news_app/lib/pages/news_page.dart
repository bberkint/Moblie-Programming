import 'package:flutter/material.dart';
import 'package:news_app/viewmodel/artical_list_view_model.dart';
import 'package:provider/provider.dart';

import '../models/news_category.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<NewsCategory> categories = [
    NewsCategory(key: "business", title: "İş"),
    NewsCategory(key: "entertainment", title: "Eğlence"),
    NewsCategory(key: "general", title: "Genel"),
    NewsCategory(key: "health", title: "Sağlık"),
    NewsCategory(key: "science", title: "Bilim"),
    NewsCategory(key: "sports", title: "Spor"),
    NewsCategory(key: "technology", title: "Teknoloji"),
  ];

  get vm => null;
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ArticleListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("My News App"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 80,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: getCategoriesTab(vm),
            ),
          ),
          getWidgetByStatus(vm),
        ],
      ),
    );
  }

  Widget getWidgetByStatus(ArticleListViewModel vm) {
    switch (vm.status.value) {
      case 3:
        return Expanded(
          child: ListView.builder(
            itemCount: vm.articleViewModel.articles.length,
            itemBuilder: (context, index) => Card(
              child: Column(
                children: [
                  Image.network(vm
                          .articleViewModel.articles[index].urlToImage ??
                      "https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png?20210219185637"),
                  ListTile(
                    title:
                        Text(vm.articleViewModel.articles[index].title ?? "-"),
                    subtitle: Text(
                        vm.articleViewModel.articles[index].description ?? "-"),
                  ),
                  ButtonBar(
                    children: [
                      MaterialButton(
                        onPressed: () {
                          //launchUrl(
                          //  vm.articleViewModel.articles[index].url ?? "_");
                        },
                        child: Text(
                          "Details...",
                          style: TextStyle(color: Colors.blue),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      default:
        return const Center(
          child: CircularProgressIndicator(),
        );
    }
  }

  List<GestureDetector> getCategoriesTab(ArticleListViewModel) {
    List<GestureDetector> categoriesTabList = [];
    for (int i = 0; i < categories.length; i++) {
      categoriesTabList.add(
        GestureDetector(
          onTap: () => vm.getNews(categories[i].key),
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: Card(
              margin: EdgeInsets.all(11),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  categories[i].title,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ),
      );
    }
    return categoriesTabList;
  }
}
