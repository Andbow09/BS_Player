import 'package:flutter/material.dart';

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

  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;
  set isPlaying(bool value) {
    _isPlaying = value;
  }

  String _currentTitle = '';
  String get currentTitle => _currentTitle;
  set currentTitle(String value) {
    _currentTitle = value;
  }

  int _currentId = 0;
  int get currentId => _currentId;
  set currentId(int value) {
    _currentId = value;
  }

  String _currentArtist = '';
  String get currentArtist => _currentArtist;
  set currentArtist(String value) {
    _currentArtist = value;
  }

  String _currentAlbum = '';
  String get currentAlbum => _currentAlbum;
  set currentAlbum(String value) {
    _currentAlbum = value;
  }

  Color _currentColor = Color(4293844457);
  Color get currentColor => _currentColor;
  set currentColor(Color value) {
    _currentColor = value;
  }

  Color _currentLightColor = Colors.transparent;
  Color get currentLightColor => _currentLightColor;
  set currentLightColor(Color value) {
    _currentLightColor = value;
  }

  Color _currentDarkColor = Colors.transparent;
  Color get currentDarkColor => _currentDarkColor;
  set currentDarkColor(Color value) {
    _currentDarkColor = value;
  }

  Color _currentTextColor = Color(4278190080);
  Color get currentTextColor => _currentTextColor;
  set currentTextColor(Color value) {
    _currentTextColor = value;
  }

  String _currentPage = '';
  String get currentPage => _currentPage;
  set currentPage(String value) {
    _currentPage = value;
  }
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
