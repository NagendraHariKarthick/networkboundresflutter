import 'dart:async';

import 'package:networkbound/networking/resource.dart';
import 'package:networkbound/repo/news_repo.dart';
import 'package:networkbound/repo/news_repo_impl.dart';
import 'package:networkbound/service_locator.dart';

import '../response.dart';
class NewsViewModel{
  final NewsRepoImpl _newsRepo = serviceLocator<NewsRepo>();
  Stream<Resource<List<Response>>> getNewsList() =>  _newsRepo.fetchNewsList();
}