// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newsdb.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorNewsDb {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$NewsDbBuilder databaseBuilder(String name) => _$NewsDbBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$NewsDbBuilder inMemoryDatabaseBuilder() => _$NewsDbBuilder(null);
}

class _$NewsDbBuilder {
  _$NewsDbBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$NewsDbBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$NewsDbBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<NewsDb> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
        : ':memory:';
    final database = _$NewsDb();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$NewsDb extends NewsDb {
  _$NewsDb([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  NewsDao _newsDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Response` (`id` TEXT, `title` TEXT, `url` TEXT, `imageUrl` TEXT, `newsSite` TEXT, `summary` TEXT, `publishedAt` TEXT, `updatedAt` TEXT, `featured` INTEGER, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  NewsDao get newsDao {
    return _newsDaoInstance ??= _$NewsDao(database, changeListener);
  }
}

class _$NewsDao extends NewsDao {
  _$NewsDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _responseInsertionAdapter = InsertionAdapter(
            database,
            'Response',
            (Response item) => <String, dynamic>{
                  'id': item.id,
                  'title': item.title,
                  'url': item.url,
                  'imageUrl': item.imageUrl,
                  'newsSite': item.newsSite,
                  'summary': item.summary,
                  'publishedAt': item.publishedAt,
                  'updatedAt': item.updatedAt,
                  'featured':
                      item.featured == null ? null : (item.featured ? 1 : 0)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Response> _responseInsertionAdapter;

  @override
  Future<List<Response>> getNewsList() async {
    return _queryAdapter.queryList('SELECT * FROM Response',
        mapper: (Map<String, dynamic> row) => Response(
            id: row['id'] as String,
            title: row['title'] as String,
            url: row['url'] as String,
            imageUrl: row['imageUrl'] as String,
            newsSite: row['newsSite'] as String,
            summary: row['summary'] as String,
            publishedAt: row['publishedAt'] as String,
            updatedAt: row['updatedAt'] as String,
            featured: row['featured'] == null
                ? null
                : (row['featured'] as int) != 0));
  }

  @override
  Future<void> insertNews(List<Response> response) async {
    await _responseInsertionAdapter.insertList(
        response, OnConflictStrategy.replace);
  }
}
