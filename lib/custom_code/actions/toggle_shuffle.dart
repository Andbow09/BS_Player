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

import 'dart:math';

Future<void> toggleShuffle() async {
  // Accedemos al App State de FlutterFlow
  final state = FFAppState();

  if (!state.isShuffleOn) {
    // ==========================================
    // ACTIVAR ALEATORIO (SHUFFLE ON)
    // ==========================================

    // 1. Hacemos una copia de seguridad de la cola original
    state.colaIdsOg = List.from(state.colaIds);
    state.colaTitulosOg = List.from(state.colaTitulos);
    state.colaRutasOg = List.from(state.colaRutas);
    state.colaColoresOg = List.from(state.colaColores);
    state.colaAlbumsOg = List.from(state.colaNombresAlbum);
    state.colaArtistasOg = List.from(state.colaNombresArtista);

    int currentIndex = state.currentIndex;
    if (currentIndex < 0 || currentIndex >= state.colaIds.length) return;

    // 2. Guardamos los datos de la canción que está sonando AHORA
    int curId = state.colaIds[currentIndex];
    String curTitulo = state.colaTitulos[currentIndex];
    String curRuta = state.colaRutas[currentIndex];
    int curColor = state.colaColores[currentIndex];
    String curAlbum = state.colaNombresAlbum[currentIndex];
    String curArtista = state.colaNombresArtista[currentIndex];

    // 3. Metemos el RESTO de canciones en "paquetes" para que no se mezclen los datos
    List<Map<String, dynamic>> restoCanciones = [];
    for (int i = 0; i < state.colaIds.length; i++) {
      if (i == currentIndex) continue; // Nos saltamos la canción actual
      restoCanciones.add({
        'id': state.colaIds[i],
        'titulo': state.colaTitulos[i],
        'ruta': state.colaRutas[i],
        'color': state.colaColores[i],
        'album': state.colaNombresAlbum[i],
        'artista': state.colaNombresArtista[i],
      });
    }

    // 4. ¡Barajamos el resto de canciones!
    restoCanciones.shuffle(Random());

    // 5. Reconstruimos las listas: La canción actual la PRIMERA, y luego el resto barajado
    state.colaIds = [curId, ...restoCanciones.map((e) => e['id'] as int)];
    state.colaTitulos = [
      curTitulo,
      ...restoCanciones.map((e) => e['titulo'] as String)
    ];
    state.colaRutas = [
      curRuta,
      ...restoCanciones.map((e) => e['ruta'] as String)
    ];
    state.colaColores = [
      curColor,
      ...restoCanciones.map((e) => e['color'] as int)
    ];
    state.colaNombresAlbum = [
      curAlbum,
      ...restoCanciones.map((e) => e['album'] as String)
    ];
    state.colaNombresArtista = [
      curArtista,
      ...restoCanciones.map((e) => e['artista'] as String)
    ];

    // 6. Actualizamos el índice y el interruptor
    state.currentIndex = 0; // Porque ahora es la primera de la lista
    state.isShuffleOn = true;
  } else {
    // ==========================================
    // DESACTIVAR ALEATORIO (SHUFFLE OFF)
    // ==========================================
    if (state.colaIdsOg.isEmpty) return;

    // 1. Miramos qué canción está sonando en este momento (por si ha pasado a la siguiente)
    int cancionSonandoId = state.colaIds[state.currentIndex];

    // 2. Restauramos todas las listas a su orden original
    state.colaIds = List.from(state.colaIdsOg);
    state.colaTitulos = List.from(state.colaTitulosOg);
    state.colaRutas = List.from(state.colaRutasOg);
    state.colaColores = List.from(state.colaColoresOg);
    state.colaNombresAlbum = List.from(state.colaAlbumsOg);
    state.colaNombresArtista = List.from(state.colaArtistasOg);

    // 3. Buscamos dónde estaba esa canción en la lista original y actualizamos el currentIndex
    int nuevoIndice = state.colaIds.indexOf(cancionSonandoId);
    if (nuevoIndice != -1) {
      state.currentIndex = nuevoIndice;
    } else {
      state.currentIndex = 0; // Por seguridad
    }

    // 4. Apagamos el interruptor
    state.isShuffleOn = false;
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
