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

  List<int> _colaIds = [];
  List<int> get colaIds => _colaIds;
  set colaIds(List<int> value) {
    _colaIds = value;
  }

  void addToColaIds(int value) {
    colaIds.add(value);
  }

  void removeFromColaIds(int value) {
    colaIds.remove(value);
  }

  void removeAtIndexFromColaIds(int index) {
    colaIds.removeAt(index);
  }

  void updateColaIdsAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    colaIds[index] = updateFn(_colaIds[index]);
  }

  void insertAtIndexInColaIds(int index, int value) {
    colaIds.insert(index, value);
  }

  List<String> _colaTitulos = [];
  List<String> get colaTitulos => _colaTitulos;
  set colaTitulos(List<String> value) {
    _colaTitulos = value;
  }

  void addToColaTitulos(String value) {
    colaTitulos.add(value);
  }

  void removeFromColaTitulos(String value) {
    colaTitulos.remove(value);
  }

  void removeAtIndexFromColaTitulos(int index) {
    colaTitulos.removeAt(index);
  }

  void updateColaTitulosAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    colaTitulos[index] = updateFn(_colaTitulos[index]);
  }

  void insertAtIndexInColaTitulos(int index, String value) {
    colaTitulos.insert(index, value);
  }

  List<String> _colaArtistas = [];
  List<String> get colaArtistas => _colaArtistas;
  set colaArtistas(List<String> value) {
    _colaArtistas = value;
  }

  void addToColaArtistas(String value) {
    colaArtistas.add(value);
  }

  void removeFromColaArtistas(String value) {
    colaArtistas.remove(value);
  }

  void removeAtIndexFromColaArtistas(int index) {
    colaArtistas.removeAt(index);
  }

  void updateColaArtistasAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    colaArtistas[index] = updateFn(_colaArtistas[index]);
  }

  void insertAtIndexInColaArtistas(int index, String value) {
    colaArtistas.insert(index, value);
  }

  List<String> _colaRutas = [];
  List<String> get colaRutas => _colaRutas;
  set colaRutas(List<String> value) {
    _colaRutas = value;
  }

  void addToColaRutas(String value) {
    colaRutas.add(value);
  }

  void removeFromColaRutas(String value) {
    colaRutas.remove(value);
  }

  void removeAtIndexFromColaRutas(int index) {
    colaRutas.removeAt(index);
  }

  void updateColaRutasAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    colaRutas[index] = updateFn(_colaRutas[index]);
  }

  void insertAtIndexInColaRutas(int index, String value) {
    colaRutas.insert(index, value);
  }

  List<String> _currentAlbums = [];
  List<String> get currentAlbums => _currentAlbums;
  set currentAlbums(List<String> value) {
    _currentAlbums = value;
  }

  void addToCurrentAlbums(String value) {
    currentAlbums.add(value);
  }

  void removeFromCurrentAlbums(String value) {
    currentAlbums.remove(value);
  }

  void removeAtIndexFromCurrentAlbums(int index) {
    currentAlbums.removeAt(index);
  }

  void updateCurrentAlbumsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    currentAlbums[index] = updateFn(_currentAlbums[index]);
  }

  void insertAtIndexInCurrentAlbums(int index, String value) {
    currentAlbums.insert(index, value);
  }

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  set currentIndex(int value) {
    _currentIndex = value;
  }
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
