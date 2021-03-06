
import 'package:get_it/get_it.dart';
import 'package:networkbound/api/news_api.dart';
import 'package:networkbound/api/news_api_impl.dart';
import 'package:networkbound/db/news_dao.dart';
import 'package:networkbound/db/newsdb.dart';
import 'package:networkbound/repo/news_repo_impl.dart';
import 'package:networkbound/viewmodel/news_viewmodel.dart';
import 'package:networkbound/repo/news_repo.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator.registerSingletonAsync<NewsDb>(() async =>
  await $FloorNewsDb.databaseBuilder('news_db.db').build());
  serviceLocator.registerSingletonAsync<NewsDao>(
          () async => (await serviceLocator.getAsync<NewsDb>()).newsDao);

  serviceLocator.registerLazySingleton<NewsRepo>(() => NewsRepoImpl());
  serviceLocator.registerLazySingleton<NewsApi>(() => NewsApiImpl());
  serviceLocator.registerFactory<NewsViewModel>(() => NewsViewModel());
}