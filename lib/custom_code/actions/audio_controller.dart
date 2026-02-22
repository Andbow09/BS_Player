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

import 'package:just_audio/just_audio.dart';

// Creamos una instancia global del reproductor para no superponer canciones
class ReproductorMaestro {
  static final ReproductorMaestro _instancia = ReproductorMaestro._interno();
  factory ReproductorMaestro() => _instancia;
  ReproductorMaestro._interno();

  final AudioPlayer player = AudioPlayer();
}

Future audioController(String accion, String? rutaAudio) async {
  final maestro = ReproductorMaestro();

  try {
    if (accion == 'play' && rutaAudio != null) {
      // Detenemos lo anterior y reproducimos la nueva ruta
      await maestro.player.stop();
      await maestro.player.setFilePath(rutaAudio);
      maestro.player.play();
    } else if (accion == 'pause') {
      // Pausamos la música actual
      await maestro.player.pause();
    } else if (accion == 'resume') {
      // Reanudamos desde donde se quedó
      maestro.player.play();
    }
  } catch (e) {
    print("Error en audio: $e");
  }
}
