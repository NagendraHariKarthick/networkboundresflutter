import 'package:networkbound/response.dart';

abstract class NewsApi {
  Future<List<Response>>  fetchNews();
}
