// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:collection/collection.dart';
import 'package:on_audio_query/on_audio_query.dart';

/// Asegúrate de que el nombre aquí coincida con tu Data Type Si tu Data Type
/// es "CancionLocal", cambia CancionStruct por CancionLocalStruct
Future<List<CancionStruct>> obtenerCanciones() async {
  final OnAudioQuery _audioQuery = OnAudioQuery();

  // 1. Pedir permisos
  bool hasPermission = await _audioQuery.checkAndRequest(
    retryRequest: true,
  );

  if (!hasPermission) {
    return []; // Si no hay permiso, devolvemos lista vacía
  }

  // 2. Consultar canciones (Corregido sortTyoe -> sortType)
  List<SongModel> songs = await _audioQuery.querySongs(
    sortType: null,
    orderType: OrderType.ASC_OR_SMALLER,
    uriType: UriType.EXTERNAL,
    ignoreCase: true,
  );

  // 3. Filtrar audios cortos
  List<SongModel> filteredSongs =
      songs.where((song) => (song.duration ?? 0) > 15000).toList();

  List<CancionStruct> resultados = [];

  // 4. Bucle corregido: usamos 'song' en el for para coincidir con el interior
  for (var song in filteredSongs) {
    String rawArtist = song.artist ?? "Desconocido";

    // Separar artistas por comas, puntos y coma o barras
    List<String> artistList = rawArtist.split(RegExp(r'[,;/]'));

    // Limpiar espacios en blanco
    artistList =
        artistList.map((e) => e.trim()).where((e) => e.isNotEmpty).toList();

    if (artistList.isEmpty) {
      artistList = ["Desconocido"];
    }

    // Añadir a la lista de resultados
    var createCancionStruct2 = CancionStruct(
      titulo: song.title,
      ruta: song.data,
      duracion: song.duration ?? 0,
      id: song.id,
      artistas: artistList,
    );
    resultados.add(createCancionStruct2);
  }

  // 5. ¡Importante! Devolver la lista final
  return resultados;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
