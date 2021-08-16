import 'package:path_provider/path_provider.dart';
import "package:sqflite/sqflite.dart";
import "dart:io";
import "package:flicks/models/model.dart";

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database? _db;

  DatabaseHelper._instance();

  String tableName = "movie_table";
  String colId = "id";
  String colTitle = "title";
  String colDirector = "director";
  String colImg = "img";
  String colDate = "date";

  Future<Database> get db async {
    if (_db == null) {
      _db = await _initDb();
    }
    return _db!;
  }

  Future<Database> _initDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + "movie_list.db";
    final movieListDb =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return movieListDb;
  }

  void _createDb(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $tableName($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT,$colDirector TEXT, $colImg TEXT,$colDate TEXT");
  }

  Future<List<Map<String, dynamic>>> getMovieMapList() async {
    Database db = await this.db;
    final List<Map<String, dynamic>> result = await db.query(tableName);
    return result;
  }

  Future<List<Movie>> getMovieList() async {
    final List<Map<String, dynamic>> movieMapList = await getMovieMapList();
    final List<Movie> movieList = [];
    movieMapList.forEach((moviemap) {
      movieList.add(Movie.fromMap(moviemap));
    });
    return movieList;
  }

  Future<int> insertMovie(Movie movie) async {
    Database db = await this.db;
    final int result = await db.insert(tableName, movie.toMap());
    return result;
  }

  Future<int> updateMovie(Movie movie) async {
    Database db = await this.db;
    final int result = await db.update(
      tableName,
      movie.toMap(),
      where: '$colId = ?',
      whereArgs: [movie.id],
    );
    return result;
  }

  Future<int> deleteMovie(int id) async {
    Database db = await this.db;
    final int result = await db.delete(
      tableName,
      where: '$colId = ?',
      whereArgs: [id],
    );
    return result;
  }
}
