import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:networkbound/response.dart';

import 'news_api.dart';

class NewsApiImpl extends NewsApi {
  @override
  Future<List<Response>> fetchNews() async {
    final response =
        await http.get('https://test.spaceflightnewsapi.net/api/v2/articles');
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      return data.map<Response>((json) => Response.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load fetchReviewRatings');
    }
  }
}
