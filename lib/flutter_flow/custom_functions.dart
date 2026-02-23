import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';

String listaATexto(List<String>? listaEntrada) {
  if (listaEntrada == null || listaEntrada.isEmpty) {
    return "Desconocido";
  }
  return listaEntrada.join(", ");
}

List<int> queueIndexGenerator(
  int currentIndex,
  int songTotal,
) {
  // Creamos una lista vacía
  List<int> indicesRestantes = [];

  // Llenamos la lista solo desde la canción actual hasta el final
  for (int i = currentIndex; i < songTotal; i++) {
    indicesRestantes.add(i);
  }

  return indicesRestantes;
}
