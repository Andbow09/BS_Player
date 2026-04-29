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

  List<Map<String, dynamic>> resultado = await db.rawQuery(
      'SELECT id, nombre, fecha_lanzamiento FROM album WHERE id = ? LIMIT 1',
      [idAlbum]);

  if (resultado.isNotEmpty) {
    return resultado.first; // Devuelve la primera fila como JSON
  }
  return {
    "nombre": "Desconocido",
    "fecha_lanzamiento": "Fecha desconocida"
  }; // Fallback
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
