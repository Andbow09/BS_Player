// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:just_audio/just_audio.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import '../actions/audio_controller.dart';

class MiniBar extends StatefulWidget {
  const MiniBar({
    Key? key,
    this.width,
    this.height,
    this.colorActivo,
    this.colorFondo,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Color? colorActivo;
  final Color? colorFondo;

  @override
  _MiniBarState createState() => _MiniBarState();
}

class _MiniBarState extends State<MiniBar> {
  // Obtenemos el cerebro del audio que creaste en tu Custom Action
  final _player = ReproductorMaestro().player;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 50.0,
      padding: EdgeInsets.symmetric(horizontal: 16.0), // Margen a los lados
      child: StreamBuilder<Duration>(
        stream: _player.positionStream,
        builder: (context, snapshot) {
          final position = snapshot.data ?? Duration.zero;
          final duration =
              _player.duration ?? position; // Evita errores al inicio

          return ProgressBar(
            progress: position,
            total: duration,
            progressBarColor: widget.colorActivo ?? Colors.black,
            baseBarColor: widget.colorFondo ?? Colors.black.withOpacity(0.1),
            thumbColor: widget.colorActivo ?? Colors.black,
            timeLabelTextStyle: TextStyle(
              color: widget.colorActivo ?? Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            // ¡Esta es la función que te permite arrastrar el cursor y saltar!
            onSeek: (nuevaPosicion) {
              _player.seek(nuevaPosicion);
            },
          );
        },
      ),
    );
  }
}
