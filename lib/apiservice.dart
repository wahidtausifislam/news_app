import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news_app/newsModel.dart';

class Apiservice {
  final String Allnewsapi =
      "https://newsapi.org/v2/everything?q=bitcoin&apiKey=da56c944b2bf412a8714afa2cd91d09d";
  final String breakingnews =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=da56c944b2bf412a8714afa2cd91d09d";
  Future<List<newsModel>> getAllnews() async {
    try {
      Response response = await http.get(Uri.parse(Allnewsapi));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json["articles"];
        List<newsModel> articlelist =
            body.map((item) => newsModel.fromJson(item)).toList();
        return articlelist;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<List<newsModel>> getbreakingnews() async {
    try {
      Response response = await http.get(Uri.parse(breakingnews));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json["articles"];
        List<newsModel> articlelist =
            body.map((item) => newsModel.fromJson(item)).toList();
        return articlelist;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
