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

  Color _currentColor = Color(4285300615);
  Color get currentColor => _currentColor;
  set currentColor(Color value) {
    _currentColor = value;
  }

  Color _currentLightColor = Colors.transparent;
  Color get currentLightColor => _currentLightColor;
  set currentLightColor(Color value) {
    _currentLightColor = value;
  }

  Color _currentDarkColor = Color(4281614661);
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

  List<int> _colaColores = [];
  List<int> get colaColores => _colaColores;
  set colaColores(List<int> value) {
    _colaColores = value;
  }

  void addToColaColores(int value) {
    colaColores.add(value);
  }

  void removeFromColaColores(int value) {
    colaColores.remove(value);
  }

  void removeAtIndexFromColaColores(int index) {
    colaColores.removeAt(index);
  }

  void updateColaColoresAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    colaColores[index] = updateFn(_colaColores[index]);
  }

  void insertAtIndexInColaColores(int index, int value) {
    colaColores.insert(index, value);
  }

  List<String> _colaAlbums = [];
  List<String> get colaAlbums => _colaAlbums;
  set colaAlbums(List<String> value) {
    _colaAlbums = value;
  }

  void addToColaAlbums(String value) {
    colaAlbums.add(value);
  }

  void removeFromColaAlbums(String value) {
    colaAlbums.remove(value);
  }

  void removeAtIndexFromColaAlbums(int index) {
    colaAlbums.removeAt(index);
  }

  void updateColaAlbumsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    colaAlbums[index] = updateFn(_colaAlbums[index]);
  }

  void insertAtIndexInColaAlbums(int index, String value) {
    colaAlbums.insert(index, value);
  }

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  set currentIndex(int value) {
    _currentIndex = value;
  }

  bool _isShuffleOn = false;
  bool get isShuffleOn => _isShuffleOn;
  set isShuffleOn(bool value) {
    _isShuffleOn = value;
  }

  List<int> _colaIdsOg = [];
  List<int> get colaIdsOg => _colaIdsOg;
  set colaIdsOg(List<int> value) {
    _colaIdsOg = value;
  }

  void addToColaIdsOg(int value) {
    colaIdsOg.add(value);
  }

  void removeFromColaIdsOg(int value) {
    colaIdsOg.remove(value);
  }

  void removeAtIndexFromColaIdsOg(int index) {
    colaIdsOg.removeAt(index);
  }

  void updateColaIdsOgAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    colaIdsOg[index] = updateFn(_colaIdsOg[index]);
  }

  void insertAtIndexInColaIdsOg(int index, int value) {
    colaIdsOg.insert(index, value);
  }

  List<String> _colaTitulosOg = [];
  List<String> get colaTitulosOg => _colaTitulosOg;
  set colaTitulosOg(List<String> value) {
    _colaTitulosOg = value;
  }

  void addToColaTitulosOg(String value) {
    colaTitulosOg.add(value);
  }

  void removeFromColaTitulosOg(String value) {
    colaTitulosOg.remove(value);
  }

  void removeAtIndexFromColaTitulosOg(int index) {
    colaTitulosOg.removeAt(index);
  }

  void updateColaTitulosOgAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    colaTitulosOg[index] = updateFn(_colaTitulosOg[index]);
  }

  void insertAtIndexInColaTitulosOg(int index, String value) {
    colaTitulosOg.insert(index, value);
  }

  List<String> _colaRutasOg = [];
  List<String> get colaRutasOg => _colaRutasOg;
  set colaRutasOg(List<String> value) {
    _colaRutasOg = value;
  }

  void addToColaRutasOg(String value) {
    colaRutasOg.add(value);
  }

  void removeFromColaRutasOg(String value) {
    colaRutasOg.remove(value);
  }

  void removeAtIndexFromColaRutasOg(int index) {
    colaRutasOg.removeAt(index);
  }

  void updateColaRutasOgAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    colaRutasOg[index] = updateFn(_colaRutasOg[index]);
  }

  void insertAtIndexInColaRutasOg(int index, String value) {
    colaRutasOg.insert(index, value);
  }

  List<int> _colaColoresOg = [];
  List<int> get colaColoresOg => _colaColoresOg;
  set colaColoresOg(List<int> value) {
    _colaColoresOg = value;
  }

  void addToColaColoresOg(int value) {
    colaColoresOg.add(value);
  }

  void removeFromColaColoresOg(int value) {
    colaColoresOg.remove(value);
  }

  void removeAtIndexFromColaColoresOg(int index) {
    colaColoresOg.removeAt(index);
  }

  void updateColaColoresOgAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    colaColoresOg[index] = updateFn(_colaColoresOg[index]);
  }

  void insertAtIndexInColaColoresOg(int index, int value) {
    colaColoresOg.insert(index, value);
  }

  List<String> _colaAlbumsOg = [];
  List<String> get colaAlbumsOg => _colaAlbumsOg;
  set colaAlbumsOg(List<String> value) {
    _colaAlbumsOg = value;
  }

  void addToColaAlbumsOg(String value) {
    colaAlbumsOg.add(value);
  }

  void removeFromColaAlbumsOg(String value) {
    colaAlbumsOg.remove(value);
  }

  void removeAtIndexFromColaAlbumsOg(int index) {
    colaAlbumsOg.removeAt(index);
  }

  void updateColaAlbumsOgAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    colaAlbumsOg[index] = updateFn(_colaAlbumsOg[index]);
  }

  void insertAtIndexInColaAlbumsOg(int index, String value) {
    colaAlbumsOg.insert(index, value);
  }

  List<String> _colaArtistasOg = [];
  List<String> get colaArtistasOg => _colaArtistasOg;
  set colaArtistasOg(List<String> value) {
    _colaArtistasOg = value;
  }

  void addToColaArtistasOg(String value) {
    colaArtistasOg.add(value);
  }

  void removeFromColaArtistasOg(String value) {
    colaArtistasOg.remove(value);
  }

  void removeAtIndexFromColaArtistasOg(int index) {
    colaArtistasOg.removeAt(index);
  }

  void updateColaArtistasOgAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    colaArtistasOg[index] = updateFn(_colaArtistasOg[index]);
  }

  void insertAtIndexInColaArtistasOg(int index, String value) {
    colaArtistasOg.insert(index, value);
  }

  int _loopMode = 0;
  int get loopMode => _loopMode;
  set loopMode(int value) {
    _loopMode = value;
  }
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
