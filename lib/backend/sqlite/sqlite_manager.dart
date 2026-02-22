import 'package:flutter/foundation.dart';

import '/backend/sqlite/init.dart';
import 'queries/read.dart';
import 'queries/update.dart';

import 'package:sqflite/sqflite.dart';
export 'queries/read.dart';
export 'queries/update.dart';

class SQLiteManager {
  SQLiteManager._();

  static SQLiteManager? _instance;
  static SQLiteManager get instance => _instance ??= SQLiteManager._();

  static late Database _database;
  Database get database => _database;

  static Future initialize() async {
    if (kIsWeb) {
      return;
    }
    _database = await initializeDatabaseFromDbFile(
      'b_s_player',
      'SQLite.db',
    );
  }

  /// START READ QUERY CALLS

  Future<List<LeerCancionesRow>> leerCanciones() => performLeerCanciones(
        _database,
      );

  Future<List<ListSongsRow>> listSongs() => performListSongs(
        _database,
      );

  /// END READ QUERY CALLS

  /// START UPDATE QUERY CALLS

  Future insertSong({
    int? id,
    String? titulo,
    String? artista,
    String? ruta,
    int? duracion,
  }) =>
      performInsertSong(
        _database,
        id: id,
        titulo: titulo,
        artista: artista,
        ruta: ruta,
        duracion: duracion,
      );

  /// END UPDATE QUERY CALLS
}
