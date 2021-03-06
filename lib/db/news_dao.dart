import 'package:floor/floor.dart';
import 'package:networkbound/response.dart';

@dao
abstract class NewsDao {
  @Query('SELECT * FROM Response')
  Future<List<Response>> getNewsList();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertNews(List<Response> response);

}