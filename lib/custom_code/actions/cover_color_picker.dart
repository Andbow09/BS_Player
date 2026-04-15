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
  Color colorGenDefecto = const Color.fromARGB(255, 83, 176, 226);

  try {
    // 1. SISTEMA DE CACHÉ (LAZY LOADING)
    if (colorGuardado != null && colorGuardado != 0) {
      Color colorBase = Color(colorGuardado);
      return _generarPaleta(colorBase, colorGenDefecto);
    }

    // 2. EXTRACCIÓN OPTIMIZADA
    final OnAudioQuery audioQuery = OnAudioQuery();

    final Uint8List? artworkBytes = await audioQuery.queryArtwork(
      cancionId,
      ArtworkType.AUDIO,
      size: 50, // Mantenemos tamaño pequeño para 0 lag
    );

    if (artworkBytes != null && artworkBytes.isNotEmpty) {
      return await Future.microtask(() async {
        final ImageProvider imageProvider = MemoryImage(artworkBytes);
        final PaletteGenerator palette =
            await PaletteGenerator.fromImageProvider(
          imageProvider,
          maximumColorCount: 8,
        );

        // Buscamos el color más dominante/vibrante, descartando blancos y negros puros
        Color? colorBase;
        double maxScore = -1.0;

        for (var pColor in palette.paletteColors) {
          HSLColor hsl = HSLColor.fromColor(pColor.color);

          if (hsl.lightness < 0.10 || hsl.lightness > 0.90) continue;

          double score = pColor.population.toDouble() * hsl.saturation;
          if (score > maxScore) {
            maxScore = score;
            colorBase = pColor.color;
          }
        }

        // Si falla, coge un color por defecto de la librería o el nuestro
        colorBase ??= palette.dominantColor?.color ??
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

// LA MAGIA MATEMÁTICA ESTÁ AQUÍ
List<Color> _generarPaleta(Color base, Color defecto) {
  HSLColor hsl = HSLColor.fromColor(base);

  // 1. COLOR PRINCIPAL (Para la MiniBar y la parte superior del Big Player)
  // Forzamos la luminosidad entre 20% y 38%. Esto asegura 100% que los
  // iconos blancos se vean nítidos y no se vea "exageradamente blanco".
  // También aseguramos un mínimo de 40% de saturación para que no se vea gris.
  double safeLightness = hsl.lightness.clamp(0.20, 0.38);
  double safeSaturation = hsl.saturation.clamp(0.40, 1.0);

  Color colorPrincipal =
      hsl.withLightness(safeLightness).withSaturation(safeSaturation).toColor();

  // 2. COLOR OSCURO (Para la parte inferior del degradado)
  // Mezclamos el color principal con un 40% de negro
  Color colorOscuro = Color.lerp(colorPrincipal, Colors.black, 0.40) ?? defecto;

  // Retornamos [Principal, Oscuro]
  return [colorPrincipal, colorOscuro];
}
