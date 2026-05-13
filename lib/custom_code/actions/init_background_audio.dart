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

import 'package:just_audio_background/just_audio_background.dart';

Future<void> initBackgroundAudio() async {
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.mycompany.bsplayer.channel.audio',
    androidNotificationChannelName: 'Reproductor de Música',
    androidNotificationOngoing: true,
    androidStopForegroundOnPause: true,
  );
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
