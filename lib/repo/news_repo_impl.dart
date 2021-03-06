import 'package:networkbound/api/news_api.dart';
import 'package:networkbound/api/news_api_impl.dart';
import 'package:networkbound/db/news_dao.dart';
import 'package:networkbound/networking/network_bound_resource.dart';
import 'package:networkbound/networking/resource.dart';
import 'package:networkbound/response.dart';

import '../service_locator.dart';
import 'news_repo.dart';

class NewsRepoImpl implements NewsRepo {
  NewsApiImpl _newsApiImpl = serviceLocator<NewsApi>();

  @override
  Stream<Resource<List<Response>>> fetchNewsList() async* {
    yield* NetworkBoundResource<List<Response>, List<Response>>().asStream(
        loadFromDb: serviceLocator<NewsDao>().getNewsList(),
        createCall: _newsApiImpl.fetchNews(),
        processResponse: (result) => result,
        saveCallResult: (result) {
          return serviceLocator<NewsDao>().insertNews(result);
        });
  }
}
