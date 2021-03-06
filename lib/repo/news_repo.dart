import 'package:networkbound/networking/resource.dart';
import 'package:networkbound/response.dart';

abstract class NewsRepo {
  Stream<Resource<List<Response>>> fetchNewsList();
}