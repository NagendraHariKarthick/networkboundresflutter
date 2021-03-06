import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:networkbound/response.dart';
import 'package:networkbound/db/news_dao.dart';


part 'newsdb.g.dart';

@Database(version: 1, entities: [Response])
abstract class NewsDb extends FloorDatabase {
  NewsDao get newsDao;
}