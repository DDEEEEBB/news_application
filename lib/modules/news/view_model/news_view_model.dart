import 'package:flutter/material.dart';
import 'package:news/api_manager/api_manager.dart';

import '../../../models/news_model.dart';

class NewsProvider extends ChangeNotifier {

  List<Articles> articles = [];
  List<Source> sources = [];

  Future<void> getNews(String source) async {
    articles = await ApiManager.getNews(source);

    notifyListeners();
  }

  Future<void> getSources([String? categoryId]) async {
    sources = await ApiManager.getSources(categoryId);
    getNews(sources[0].id??"");
    notifyListeners();
  }
}
