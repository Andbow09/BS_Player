// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:on_audio_query/on_audio_query.dart';

class SongCover extends StatefulWidget {
  const SongCover({
    Key? key,
    this.width,
    this.height,
    required this.cancionId,
  }) : super(key: key);

  final double? width;
  final double? height;
  final int cancionId;

  @override
  State<SongCover> createState() => _CaratulaCancionState();
}

class _CaratulaCancionState extends State<SongCover> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      // Usamos el widget nativo de la librería
      child: QueryArtworkWidget(
        id: widget.cancionId,
        type: ArtworkType.AUDIO,
        keepOldArtwork: true,
        // Imagen por defecto si la canción no tiene carátula
        nullArtworkWidget: Container(
          color: Colors.grey[800],
          child: Icon(
            Icons.music_note_rounded,
            color: Colors.white54,
            size: (widget.width ?? 50) * 0.5,
          ),
        ),
      ),
    );
  }
}
