import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../model/home_screen_models/NewsAPIDataModel.dart';

class HomeScreenController with ChangeNotifier
{
  NewsApiDataModel? newsData;
  bool isLoading = false;

  Future<void> fetchData()
  async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse("https://newsapi.org/v2/everything?q=keyword&apiKey=396e62005de747cd8e4074d1a1b52871");
    var responseData = await http.get(url);
    if (responseData.statusCode == 200)
      {
        newsData = newsApiDataModelFromJson(responseData.body);

      }
    isLoading = false;
    notifyListeners();
  }
}