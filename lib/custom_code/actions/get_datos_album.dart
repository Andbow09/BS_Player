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

import 'package:sqflite/sqflite.dart';

Future<dynamic> getDatosAlbum(int idAlbum) async {
  final db = SQLiteManager.instance.database;

  List<Map<String, dynamic>> resultado = await db.rawQuery('''
    SELECT 
      a.id AS album_id, 
      a.nombre AS titulo_album, 
      a.fecha_lanzamiento,
      (SELECT COUNT(id) FROM cancion WHERE id_album = a.id) AS total_canciones,
      (SELECT SUM(duracion) FROM cancion WHERE id_album = a.id) AS duracion_total,
      (SELECT MIN(id) FROM cancion WHERE id_album = a.id) AS primera_cancion_id,
      (SELECT color FROM cancion WHERE id_album = a.id AND color IS NOT NULL LIMIT 1) AS color_principal,
      (SELECT GROUP_CONCAT(ar.nombre, ', ') 
       FROM album_artista aa 
       JOIN artista ar ON aa.id_artista = ar.id 
       WHERE aa.id_album = a.id) AS nombre_artista
    FROM album a 
    WHERE a.id = ? 
    LIMIT 1
  ''', [idAlbum]);

  if (resultado.isNotEmpty) {
    return resultado.first;
  }
  return {
    "titulo_album": "Desconocido",
    "fecha_lanzamiento": "-",
    "nombre_artista": "Desconocido",
    "color_principal": null
  };
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
