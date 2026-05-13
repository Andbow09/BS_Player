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

import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<String?> guardarImagenLocal(FFUploadedFile? imagenTemp) async {
  // 1. Si no pasamos ninguna imagen, no hacemos nada y devolvemos nulo
  if (imagenTemp == null || imagenTemp.bytes == null) {
    return null;
  }

  try {
    // 2. Buscamos la carpeta permanente y segura de tu aplicación
    final directory = await getApplicationDocumentsDirectory();

    // 3. Inventamos un nombre único para que no se sobreescriban unas a otras
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final nombreArchivo = 'lista_cover_$timestamp.jpg';

    // 4. Definimos la ruta completa
    final rutaCompleta = '${directory.path}/$nombreArchivo';

    // 5. Escribimos la imagen en la memoria del teléfono de forma permanente
    final file = File(rutaCompleta);
    await file.writeAsBytes(imagenTemp.bytes!);

    // 6. Devolvemos la ruta de texto para guardarla en tu SQLite
    return rutaCompleta;
  } catch (e) {
    print('Error al guardar la imagen: $e');
    return null;
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
