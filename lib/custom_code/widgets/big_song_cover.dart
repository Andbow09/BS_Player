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

import 'package:on_audio_query/on_audio_query.dart';

class BigSongCover extends StatefulWidget {
  const BigSongCover({
    Key? key,
    this.width,
    this.height,
    required this.cancionId,
  }) : super(key: key);

  final double? width;
  final double? height;
  final int cancionId;

  @override
  State<BigSongCover> createState() => _CaratulaCancionState();
}

class _CaratulaCancionState extends State<BigSongCover> {
  @override
  Widget build(BuildContext context) {
    // Si FF no manda tamaño, forzamos 50x50 para que no desaparezca
    final double safeWidth = widget.width ?? 50.0;
    final double safeHeight = widget.height ?? 50.0;

    return Container(
      width: safeWidth,
      height: safeHeight,
      child: QueryArtworkWidget(
        id: widget.cancionId,
        type: ArtworkType.AUDIO, // Tipo de archivo
        size: 1500, // <-- EL SECRETO: Le pedimos resolución de 1500x1500
        artworkQuality: FilterQuality
            .high, // <-- Le pedimos la máxima calidad de renderizado
        artworkBorder:
            BorderRadius.circular(8.0), // Bordes redondeados automáticos
        // Qué mostrar si la canción no tiene carátula
        nullArtworkWidget: Container(
          width: safeWidth,
          height: safeHeight,
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Icon(
            Icons.music_note_rounded,
            color: Colors.white54,
            size: safeWidth * 0.5,
          ),
        ),
      ),
    );
  }
}
