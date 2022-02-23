import 'package:flutter/material.dart';
import 'package:news/pages/CategoryPage.dart';
import 'package:news/pages/HomePage.dart';
import 'package:news/pages/NewsDetailsPage.dart';
import 'package:news/pages/NewsListPage.dart';
import 'package:news/pages/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'splash-screen',
      routes: {
        "splash-screen": (context) => const SplashScreen(),
        "home-page": (context) => const HomePage(),
        // "news-details": (context) => const NewsDetailsPage(),
        "category-list": (context) => const CategoryPage(),
        // "news-list": (context) => NewsListPage(),
        // "news-search": (context) => const NewsDetailsPage(),
      },
    );
  }
}
