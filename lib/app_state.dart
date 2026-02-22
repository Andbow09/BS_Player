import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  CancionStruct _currentSong = CancionStruct();
  CancionStruct get currentSong => _currentSong;
  set currentSong(CancionStruct value) {
    _currentSong = value;
  }

  void updateCurrentSongStruct(Function(CancionStruct) updateFn) {
    updateFn(_currentSong);
  }

  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;
  set isPlaying(bool value) {
    _isPlaying = value;
  }
}
