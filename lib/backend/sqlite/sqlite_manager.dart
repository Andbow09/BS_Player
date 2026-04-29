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
      'SQLite_(1)_(1).db',
    );
  }

  /// START READ QUERY CALLS

  Future<List<LeerCancionesRow>> leerCanciones() => performLeerCanciones(
        _database,
      );

  Future<List<ListSongsRow>> listSongs() => performListSongs(
        _database,
      );

  Future<List<ListAlbumsRow>> listAlbums() => performListAlbums(
        _database,
      );

  Future<List<GetRandomSongRow>> getRandomSong() => performGetRandomSong(
        _database,
      );

  Future<List<GetAlbumRow>> getAlbum({
    String? paramAlbum,
    String? paramArtista,
  }) =>
      performGetAlbum(
        _database,
        paramAlbum: paramAlbum,
        paramArtista: paramArtista,
      );

  Future<List<GetAlbum2Row>> getAlbum2({
    int? idAlbum,
  }) =>
      performGetAlbum2(
        _database,
        idAlbum: idAlbum,
      );

  Future<List<ListSongsAlbumRow>> listSongsAlbum({
    int? idAlbum,
  }) =>
      performListSongsAlbum(
        _database,
        idAlbum: idAlbum,
      );

  Future<List<ConsultaPruebaDiscoRow>> consultaPruebaDisco() =>
      performConsultaPruebaDisco(
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

  Future updateColor({
    int? color,
    int? id,
  }) =>
      performUpdateColor(
        _database,
        color: color,
        id: id,
      );

  /// END UPDATE QUERY CALLS
}
