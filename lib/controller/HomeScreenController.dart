import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class HomeScreenController with ChangeNotifier
{
  Future<void> fetchData()
  async {
    final url = Uri.parse("https://newsapi.org/v2/everything?q=keyword&apiKey=396e62005de747cd8e4074d1a1b52871");
    var responseData = await http.get(url);
    print('responseData' + responseData.statusCode.toString());
    print('responseBody' + responseData.body);
  }
}