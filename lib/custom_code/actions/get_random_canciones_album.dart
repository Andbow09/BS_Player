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

Future<List<dynamic>> getRandomCancionesAlbum(int idAlbum) async {
  final db = SQLiteManager.instance.database;

  List<Map<String, dynamic>> resultado = await db.rawQuery('''
    SELECT
      c.id,
      c.nombre AS titulo,
      IFNULL(c.duracion, 0) AS duracion,
      c.ruta_archivo AS ruta,
      IFNULL(c.color, 0) AS color,
      IFNULL(c.numero_track, 0) AS numero_track,
      IFNULL(al.nombre, 'Desconocido') AS album,
      IFNULL(GROUP_CONCAT(ar.nombre, ', '), 'Desconocido') AS artista
    FROM cancion c
    LEFT JOIN album al ON c.id_album = al.id
    LEFT JOIN cancion_artista ca ON c.id = ca.id_cancion
    LEFT JOIN artista ar ON ca.id_artista = ar.id
    WHERE c.id_album = ?
    GROUP BY c.id
    ORDER BY RANDOM();
  ''', [idAlbum]);

  return resultado;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
