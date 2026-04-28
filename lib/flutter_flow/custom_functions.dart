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

int colorToInt(Color color) {
  return color.value;
}

String formatearDuracion(int milisegundos) {
  if (milisegundos == null || milisegundos == 0) {
    return "0:00";
  }

  // Convertimos los milisegundos a un objeto Duration de Dart
  Duration duration = Duration(milliseconds: milisegundos);

  // Función auxiliar para asegurarnos de que siempre haya dos dígitos (ej. "05" en vez de "5")
  String twoDigits(int n) => n.toString().padLeft(2, "0");

  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

  // Si el álbum dura más de una hora, mostramos "H:MM:SS"
  if (duration.inHours > 0) {
    return "${duration.inHours}:$twoDigitMinutes:$twoDigitSeconds";
  }
  // Si dura menos de una hora, mostramos solo "M:SS" o "MM:SS"
  else {
    return "${duration.inMinutes}:$twoDigitSeconds";
  }
}
