import '/components/bottom_menu/bottom_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'disc_widget.dart' show DiscWidget;
import 'package:flutter/material.dart';

class DiscModel extends FlutterFlowModel<DiscWidget> {
  ///  Local state fields for this page.

  List<Color> paletaAlbum = [];
  void addToPaletaAlbum(Color item) => paletaAlbum.add(item);
  void removeFromPaletaAlbum(Color item) => paletaAlbum.remove(item);
  void removeAtIndexFromPaletaAlbum(int index) => paletaAlbum.removeAt(index);
  void insertAtIndexInPaletaAlbum(int index, Color item) =>
      paletaAlbum.insert(index, item);
  void updatePaletaAlbumAtIndex(int index, Function(Color) updateFn) =>
      paletaAlbum[index] = updateFn(paletaAlbum[index]);

  dynamic datosAlbum;

  bool cargando = true;

  List<dynamic> listaCanciones = [];
  void addToListaCanciones(dynamic item) => listaCanciones.add(item);
  void removeFromListaCanciones(dynamic item) => listaCanciones.remove(item);
  void removeAtIndexFromListaCanciones(int index) =>
      listaCanciones.removeAt(index);
  void insertAtIndexInListaCanciones(int index, dynamic item) =>
      listaCanciones.insert(index, item);
  void updateListaCancionesAtIndex(int index, Function(dynamic) updateFn) =>
      listaCanciones[index] = updateFn(listaCanciones[index]);

  double offsetY = 0.0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getDatosAlbum] action in Disc widget.
  dynamic resultadoSQL;
  // Stores action output result for [Custom Action - coverColorPicker] action in Disc widget.
  List<Color>? coloresGenerados;
  // Stores action output result for [Custom Action - getCancionesAlbum] action in Disc widget.
  List<dynamic>? listaCancionesAlbum;
  // State field(s) for infoAlbum widget.
  ScrollController? infoAlbumScrollController;
  // Stores action output result for [Custom Action - coverColorPicker] action in Container widget.
  List<Color>? colorElegido;
  // Stores action output result for [Custom Action - getRandomCancionesAlbum] action in Container widget.
  List<dynamic>? cancionesRandom;
  // Stores action output result for [Custom Action - coverColorPicker] action in Container widget.
  List<Color>? colorElegidoRandom;
  // Stores action output result for [Custom Action - coverColorPicker] action in Container widget.
  List<Color>? colorElegidoEspecifico;
  // Model for bottomMenu component.
  late BottomMenuModel bottomMenuModel;

  @override
  void initState(BuildContext context) {
    infoAlbumScrollController = ScrollController();
    bottomMenuModel = createModel(context, () => BottomMenuModel());
  }

  @override
  void dispose() {
    infoAlbumScrollController?.dispose();
    bottomMenuModel.dispose();
  }
}
