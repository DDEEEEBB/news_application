import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/models/news_model.dart';


class ApiManager {
 static const String _baseUrl = "https://newsapi.org/v2/";
 static const String _apiKey = "apiKey=81797cb7c05944c7b254815d4472837c";

 static Future <List<Articles>> getNews(String source)async{
    var url =Uri.parse("${_baseUrl}everything?$_apiKey&sources=$source");
    var response =await http.get(url);
    var json = jsonDecode(response.body);
    var data = NewsModel.fromJson(json);

    return data.articles??[];
  }

 static Future <List<Source>> getSources([String? category])async{
   List<Source> sources =[];
    var url =Uri.parse("${_baseUrl}top-headlines/sources?$_apiKey&category=$category");
    var response =await http.get(url);
    var json = jsonDecode(response.body);
    for(var e in json["sources"]){
      sources.add(Source.fromJson(e));
    }
    return sources;
  }
}