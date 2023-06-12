import 'package:flutter/material.dart';
import 'package:news_app/pages/news_page.dart';
import 'package:news_app/viewmodel/artical_list_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (context) => ArticleListViewModel(),
        child: NewsPage(),
      ),
    );
  }
}
