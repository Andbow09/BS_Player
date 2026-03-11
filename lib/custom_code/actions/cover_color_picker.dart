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

Future<List<Color>> coverColorPicker(
  int cancionId,
  int? colorGuardado,
) async {
  Color colorBase;
  Color colorGenDefecto = const Color.fromARGB(255, 83, 176, 226);

  try {
    // 1. SISTEMA DE CACHÉ (LAZY LOADING)
    if (colorGuardado != null && colorGuardado != 0) {
      Color colorBase = Color(colorGuardado);
      return _generarPaleta(colorBase, colorGenDefecto);
    }

    // 2. EXTRACCIÓN OPTIMIZADA (Solo ocurre la 1ª vez que se escucha la canción)
    final OnAudioQuery audioQuery = OnAudioQuery();

    final Uint8List? artworkBytes = await audioQuery.queryArtwork(
      cancionId,
      ArtworkType.AUDIO,
      size: 50, // ¡CLAVE PARA QUE NO HAYA LAG!
    );

    if (artworkBytes != null && artworkBytes.isNotEmpty) {
      return await Future.microtask(() async {
        final ImageProvider imageProvider = MemoryImage(artworkBytes);
        final PaletteGenerator palette =
            await PaletteGenerator.fromImageProvider(
          imageProvider,
          maximumColorCount: 8,
        );

        PaletteColor? mejorCandidato;
        double maxScore = -1.0;

        for (var pColor in palette.paletteColors) {
          HSLColor hsl = HSLColor.fromColor(pColor.color);
          if (hsl.lightness < 0.15 ||
              hsl.lightness > 0.85 ||
              hsl.saturation < 0.15) continue;

          double score = pColor.population.toDouble() * hsl.saturation;
          if (score > maxScore) {
            maxScore = score;
            mejorCandidato = pColor;
          }
        }

        Color colorBase = mejorCandidato?.color ??
            palette.dominantColor?.color ??
            palette.vibrantColor?.color ??
            colorGenDefecto;
        return _generarPaleta(colorBase, colorGenDefecto);
      });
    } else {
      return _generarPaleta(colorGenDefecto, colorGenDefecto);
    }
  } catch (e) {
    print("Error extrayendo paleta: $e");
    return _generarPaleta(colorGenDefecto, colorGenDefecto);
  }
}

// Función auxiliar para crear todos los tonos de la UI
List<Color> _generarPaleta(Color base, Color defecto) {
  Color fondoPastel = Color.lerp(base, Colors.white, 0.85) ?? defecto;
  Color barraInactiva = Color.lerp(base, Colors.white, 0.45) ?? base;
  Color barraActiva = Color.lerp(base, Colors.black, 0.15) ?? base;
  return [base, fondoPastel, barraInactiva, barraActiva, Colors.black87];
}
