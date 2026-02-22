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
  // Colores por defecto de seguridad
  Color colorGenDefecto = const Color(0xFFF5E6E8);
  Color colorClaroDefecto = const Color(0xFFFFFFFF);
  Color colorOscuroDefecto = const Color(0xFF222222);

  try {
    final OnAudioQuery audioQuery = OnAudioQuery();

    // 1. Pedimos la foto
    final Uint8List? artworkBytes = await audioQuery.queryArtwork(
      cancionId,
      ArtworkType.AUDIO,
      size: 200,
    );

    if (artworkBytes != null && artworkBytes.isNotEmpty) {
      final ImageProvider imageProvider = MemoryImage(artworkBytes);

      // 2. Extraemos la paleta completa
      final PaletteGenerator palette = await PaletteGenerator.fromImageProvider(
        imageProvider,
        maximumColorCount: 16,
      );

      // 3. Seleccionamos los 3 tonos
      // General (Dominante)
      Color general = palette.dominantColor?.color ??
          palette.vibrantColor?.color ??
          colorGenDefecto;

      // Claro (Vibrante claro o Muted claro)
      Color claro = palette.lightVibrantColor?.color ??
          palette.lightMutedColor?.color ??
          general.withOpacity(0.7);

      // Oscuro (Vibrante oscuro o Muted oscuro)
      Color oscuro = palette.darkVibrantColor?.color ??
          palette.darkMutedColor?.color ??
          general.withOpacity(0.3);

      // Devolvemos la lista exactamente en este orden: [0] General, [1] Claro, [2] Oscuro
      return [general, claro, oscuro];
    }
  } catch (e) {
    print("Error extrayendo paleta: $e");
  }

  // Si no hay foto o da error, devolvemos los 3 por defecto
  return [colorGenDefecto, colorClaroDefecto, colorOscuroDefecto];
}
