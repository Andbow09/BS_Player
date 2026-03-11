import 'package:sqflite/sqflite.dart';

/// BEGIN INSERTSONG
Future performInsertSong(
  Database database, {
  int? id,
  String? titulo,
  String? artista,
  String? ruta,
  int? duracion,
}) {
  final query = '''
INSERT INTO canciones (id, titulo, artista, ruta, cancion)
VALUES (${id}, '${titulo}', '${artista}', '${ruta}', ${duracion})
''';
  return database.rawQuery(query);
}

/// END INSERTSONG

/// BEGIN UPDATECOLOR
Future performUpdateColor(
  Database database, {
  int? color,
  int? id,
}) {
  final query = '''
UPDATE cancion SET color = ? WHERE id = ?
''';
  return database.rawQuery(query);
}

/// END UPDATECOLOR
