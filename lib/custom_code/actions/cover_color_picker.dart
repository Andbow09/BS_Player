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
import 'package:palette_generator/palette_generator.dart';

Future<List<Color>> coverColorPicker(int cancionId) async {
  Color colorGenDefecto = const Color(0xFFF5E6E8); // Tu rosa clarito original
  Color colorClaroDefecto = const Color(0xFFFFFFFF);
  Color colorOscuroDefecto = const Color(0xFF222222);

  try {
    final OnAudioQuery audioQuery = OnAudioQuery();
    final Uint8List? artworkBytes = await audioQuery.queryArtwork(
      cancionId,
      ArtworkType.AUDIO,
      size: 200,
    );

    if (artworkBytes != null && artworkBytes.isNotEmpty) {
      final ImageProvider imageProvider = MemoryImage(artworkBytes);
      final PaletteGenerator palette = await PaletteGenerator.fromImageProvider(
        imageProvider,
        maximumColorCount: 16,
      );

      // 1. EL CAMBIO CLAVE: Priorizamos el color Dominante (el que más abunda, ej. el fondo amarillo)
      Color colorBase = palette.dominantColor?.color ??
          palette.vibrantColor?.color ??
          colorGenDefecto;

      // 2. CREAMOS LA ESCALA MONOCROMÁTICA MATEMÁTICAMENTE:

      // [0] Fondo de la app: Muy clarito (Mezclamos el base con 80% de blanco)
      Color fondoPastel =
          Color.lerp(colorBase, Colors.white, 0.4) ?? colorGenDefecto;

      // [1] Barra de fondo (Inactiva): Un poco más oscura que el fondo (Mezclamos con 40% de blanco)
      Color barraInactiva =
          Color.lerp(colorBase, Colors.white, 0.2) ?? colorBase;

      // [2] Barra Activa: El color puro o un pelín más oscuro (Mezclamos con 10% de negro para darle fuerza)
      Color barraActiva = Color.lerp(colorBase, Colors.black, 0.1) ?? colorBase;

      // 3. Como el fondo AHORA SIEMPRE ES PASTEL (claro), el texto siempre puede ser oscuro.
      // Usamos un negro suave (Colors.black87) que queda mucho más elegante que el negro puro.
      Color colorTexto = Colors.black87;

      // Devolvemos: [0] General (ahora pastel), [1] Claro, [2] Oscuro, [3] Color de Texto
      return [fondoPastel, barraInactiva, barraActiva, colorTexto];
    }
  } catch (e) {
    print("Error extrayendo paleta: $e");
  }

  return [
    colorGenDefecto,
    colorClaroDefecto,
    colorOscuroDefecto,
    Colors.black87
  ];
}
