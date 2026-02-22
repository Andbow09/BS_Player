import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN LEERCANCIONES
Future<List<LeerCancionesRow>> performLeerCanciones(
  Database database,
) {
  final query = '''
SELECT * FROM cancion
''';
  return _readQuery(database, query, (d) => LeerCancionesRow(d));
}

class LeerCancionesRow extends SqliteRow {
  LeerCancionesRow(Map<String, dynamic> data) : super(data);
}

/// END LEERCANCIONES

/// BEGIN LISTSONGS
Future<List<ListSongsRow>> performListSongs(
  Database database,
) {
  final query = '''
SELECT 
    c.id, 
    c.nombre AS titulo, 
    c.duracion, 
    c.ruta_archivo AS ruta, 
    al.nombre AS album,
    GROUP_CONCAT(ar.nombre, ', ') AS artista
FROM cancion c
LEFT JOIN album al ON c.id_album = al.id
LEFT JOIN cancion_artista ca ON c.id = ca.id_cancion
LEFT JOIN artista ar ON ca.id_artista = ar.id
GROUP BY c.id
ORDER BY c.nombre ASC;
''';
  return _readQuery(database, query, (d) => ListSongsRow(d));
}

class ListSongsRow extends SqliteRow {
  ListSongsRow(Map<String, dynamic> data) : super(data);

  int get id => data['id'] as int;
  String get nombre => data['nombre'] as String;
  int get duracion => data['duracion'] as int;
  String get rutaArchivo => data['rutaArchivo'] as String;
  String get nombreAlbum => data['nombreAlbum'] as String;
  String get artistas => data['artistas'] as String;
}

/// END LISTSONGS
