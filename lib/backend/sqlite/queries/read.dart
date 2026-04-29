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
    c.color,
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
  String get titulo => data['titulo'] as String;
  int get duracion => data['duracion'] as int;
  String get ruta => data['ruta'] as String;
  String get album => data['album'] as String;
  String get artista => data['artista'] as String;
  int get color => data['color'] as int;
}

/// END LISTSONGS

/// BEGIN LISTALBUMS
Future<List<ListAlbumsRow>> performListAlbums(
  Database database,
) {
  final query = '''
SELECT 
  a.id AS album_id, 
  a.nombre AS titulo_album, 
  a.fecha_lanzamiento, 
  MIN(c.id) AS cancion_id,
  GROUP_CONCAT(DISTINCT ar.nombre) AS nombre_artista
FROM album a
LEFT JOIN cancion c ON a.id = c.id_album
LEFT JOIN album_artista aa ON a.id = aa.id_album
LEFT JOIN artista ar ON aa.id_artista = ar.id
GROUP BY a.id, a.nombre, a.fecha_lanzamiento
ORDER BY a.nombre ASC;
''';
  return _readQuery(database, query, (d) => ListAlbumsRow(d));
}

class ListAlbumsRow extends SqliteRow {
  ListAlbumsRow(Map<String, dynamic> data) : super(data);

  int get albumId => data['album_id'] as int;
  String get tituloAlbum => data['titulo_album'] as String;
  String get fechaLanzamiento => data['fecha_lanzamiento'] as String;
  int get cancionId => data['cancion_id'] as int;
  String get nombreArtista => data['nombre_artista'] as String;
}

/// END LISTALBUMS

/// BEGIN GETRANDOMSONG
Future<List<GetRandomSongRow>> performGetRandomSong(
  Database database,
) {
  final query = '''
SELECT 
    c.id, 
    c.nombre AS titulo, 
    c.duracion, 
    c.ruta_archivo, 
    c.favorita, 
    c.color,
    al.nombre AS nombre_album,
    GROUP_CONCAT(ar.nombre, ', ') AS nombre_artista
FROM cancion c
LEFT JOIN album al ON c.id_album = al.id
LEFT JOIN cancion_artista ca ON c.id = ca.id_cancion
LEFT JOIN artista ar ON ca.id_artista = ar.id
GROUP BY c.id
ORDER BY RANDOM();
''';
  return _readQuery(database, query, (d) => GetRandomSongRow(d));
}

class GetRandomSongRow extends SqliteRow {
  GetRandomSongRow(Map<String, dynamic> data) : super(data);

  int get id => data['id'] as int;
  String get titulo => data['titulo'] as String;
  int get duracion => data['duracion'] as int;
  String get rutaArchivo => data['ruta_archivo'] as String;
  int get favorita => data['favorita'] as int;
  int get color => data['color'] as int;
  String get nombreAlbum => data['nombre_album'] as String;
  String get nombreArtista => data['nombre_artista'] as String;
}

/// END GETRANDOMSONG

/// BEGIN GETALBUM
Future<List<GetAlbumRow>> performGetAlbum(
  Database database, {
  String? paramAlbum,
  String? paramArtista,
}) {
  final query = '''
SELECT a.id 
FROM album a
JOIN album_artista aa ON a.id = aa.id_album
JOIN artista art ON aa.id_artista = art.id
WHERE a.nombre = paramAlbum
  AND art.nombre = paramArtista
LIMIT 1;
''';
  return _readQuery(database, query, (d) => GetAlbumRow(d));
}

class GetAlbumRow extends SqliteRow {
  GetAlbumRow(Map<String, dynamic> data) : super(data);

  int get id => data['id'] as int;
}

/// END GETALBUM

/// BEGIN GETALBUM2
Future<List<GetAlbum2Row>> performGetAlbum2(
  Database database, {
  int? idAlbum,
}) {
  final query = '''
SELECT
  a.id AS id_album,
  a.nombre AS titulo_album,
  a.fecha_lanzamiento,
  MIN(c.id) AS cancion_id,
  SUM(c.duracion) AS duracion_total,
  GROUP_CONCAT(DISTINCT art.nombre) AS nombre_artista,
  MIN(art.id) AS id_artista,
  GROUP_CONCAT(DISTINCT ed.nombre) AS nombre_editor,
  MIN(ed.id) AS id_editor
FROM album a
LEFT JOIN cancion c ON a.id = c.id_album
LEFT JOIN album_artista aa ON a.id = aa.id_album
LEFT JOIN artista art ON aa.id_artista = art.id
LEFT JOIN album_editor ae ON a.id = ae.id_album
LEFT JOIN editor ed ON ae.id_editor = ed.id
WHERE a.id = idAlbum
GROUP BY a.id
LIMIT 1;
''';
  return _readQuery(database, query, (d) => GetAlbum2Row(d));
}

class GetAlbum2Row extends SqliteRow {
  GetAlbum2Row(Map<String, dynamic> data) : super(data);

  int get id => data['id'] as int;
  String get tituloAlbum => data['titulo_album'] as String;
  String get fechaLanzamiento => data['fecha_lanzamiento'] as String;
  int get cancionId => data['cancion_id'] as int;
  int get duracionTotal => data['duracion_total'] as int;
  String get nombreArtista => data['nombre_artista'] as String;
  int get idArtista => data['id_artista'] as int;
  String? get nombreEditor => data['nombre_editor'] as String?;
  String? get idEditor => data['id_editor'] as String?;
}

/// END GETALBUM2

/// BEGIN LISTSONGSALBUM
Future<List<ListSongsAlbumRow>> performListSongsAlbum(
  Database database, {
  int? idAlbum,
}) {
  final query = '''
SELECT 
    c.id, 
    c.nombre AS titulo, 
    c.duracion, 
    c.ruta_archivo AS ruta, 
    c.color,
    c.numero_track,
    al.nombre AS album,
    GROUP_CONCAT(ar.nombre, ', ') AS artista
FROM cancion c
LEFT JOIN album al ON c.id_album = al.id
LEFT JOIN cancion_artista ca ON c.id = ca.id_cancion
LEFT JOIN artista ar ON ca.id_artista = ar.id
WHERE id_album = idAlbum
GROUP BY c.id
ORDER BY
  numero_track IS NULL,
  numero_track ASC,
  nombre ASC;
''';
  return _readQuery(database, query, (d) => ListSongsAlbumRow(d));
}

class ListSongsAlbumRow extends SqliteRow {
  ListSongsAlbumRow(Map<String, dynamic> data) : super(data);

  int get id => data['id'] as int;
  String get titulo => data['titulo'] as String;
  int get duracion => data['duracion'] as int;
  String get ruta => data['ruta'] as String;
  String get album => data['album'] as String;
  String get artista => data['artista'] as String;
  int get color => data['color'] as int;
  int? get numeroTrack => data['numero_track'] as int?;
}

/// END LISTSONGSALBUM

/// BEGIN CONSULTAPRUEBADISCO
Future<List<ConsultaPruebaDiscoRow>> performConsultaPruebaDisco(
  Database database,
) {
  final query = '''
SELECT 
  id, 
  nombre, 
  fecha_lanzamiento 
FROM album
WHERE id = 48;
''';
  return _readQuery(database, query, (d) => ConsultaPruebaDiscoRow(d));
}

class ConsultaPruebaDiscoRow extends SqliteRow {
  ConsultaPruebaDiscoRow(Map<String, dynamic> data) : super(data);

  int get id => data['id'] as int;
  String get nombre => data['nombre'] as String;
  String get fechaLanzamiento => data['fecha_lanzamiento'] as String;
}

/// END CONSULTAPRUEBADISCO
