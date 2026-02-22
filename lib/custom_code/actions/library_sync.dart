// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:on_audio_query/on_audio_query.dart';
import 'package:sqflite/sqflite.dart';

Future<bool> librarySync() async {
  final OnAudioQuery _audioQuery = OnAudioQuery();

  // 1. Pedir permisos
  bool hasPermission = await _audioQuery.checkAndRequest(retryRequest: true);
  if (!hasPermission) return false;

  // 2. Obtener TODAS las canciones del móvil
  List<SongModel> songs = await _audioQuery.querySongs(
    sortType: null,
    orderType: OrderType.ASC_OR_SMALLER,
    uriType: UriType.EXTERNAL,
    ignoreCase: true,
  );

  // Filtrar audios cortos (basura de WhatsApp, notificaciones...)
  List<SongModel> audiosValidos =
      songs.where((s) => (s.duration ?? 0) > 15000).toList();

  if (audiosValidos.isEmpty) return true;

  // 3. Conectar a la base de datos SQLite de FlutterFlow
  final db = SQLiteManager.instance.database;

  // 4. Iniciar una TRANSACCIÓN (Para procesar miles de archivos en milisegundos)
  await db.transaction((txn) async {
    for (var song in audiosValidos) {
      String ruta = song.data;
      int idOriginal = song.id;

      // A. ¿Ya existe esta canción en SQLite?
      List<Map> cancionExiste = await txn.rawQuery(
        'SELECT id FROM cancion WHERE id = ?',
        [idOriginal],
      );

      // Si ya existe, nos la saltamos para no duplicar
      if (cancionExiste.isNotEmpty) continue;

      // B. Gestionar el ÁLBUM
      String nombreAlbum = song.album ?? 'Desconocido';
      int idAlbum;
      List<Map> albumRes = await txn.rawQuery(
        'SELECT id FROM album WHERE nombre = ?',
        [nombreAlbum],
      );

      if (albumRes.isNotEmpty) {
        idAlbum = albumRes.first['id'] as int;
      } else {
        // Si no existe, lo creamos
        idAlbum = await txn.rawInsert(
          'INSERT INTO album (nombre) VALUES (?)',
          [nombreAlbum],
        );
      }

      // C. Insertar la CANCIÓN (Forzando el ID del móvil para las carátulas)
      String titulo = song.title;
      int duracion = song.duration ?? 0;

      await txn.rawInsert(
        'INSERT INTO cancion (id, nombre, duracion, ruta_archivo, id_album) VALUES (?, ?, ?, ?, ?)',
        [idOriginal, titulo, duracion, ruta, idAlbum],
      );

      // D. Gestionar ARTISTAS
      String rawArtist = song.artist ?? 'Desconocido';
      List<String> artistas = rawArtist
          .split(RegExp(r'[,;/]'))
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toList();

      if (artistas.isEmpty) artistas = ['Desconocido'];

      for (String nombreArtista in artistas) {
        int idArtista;
        List<Map> artistaRes = await txn.rawQuery(
          'SELECT id FROM artista WHERE nombre = ?',
          [nombreArtista],
        );

        if (artistaRes.isNotEmpty) {
          idArtista = artistaRes.first['id'] as int;
        } else {
          // Si el artista no existe, lo creamos
          idArtista = await txn.rawInsert(
            'INSERT INTO artista (nombre) VALUES (?)',
            [nombreArtista],
          );
        }

        // E. Crear la relación en la tabla intermedia (CANCION_ARTISTA)
        await txn.rawInsert(
          'INSERT INTO cancion_artista (id_cancion, id_artista) VALUES (?, ?)',
          [idOriginal, idArtista],
        );
      }
    }
  });

  return true; // Sincronización completada con éxito
}
