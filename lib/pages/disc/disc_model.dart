import '/backend/sqlite/sqlite_manager.dart';
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

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getDatosAlbum] action in Disc widget.
  dynamic resultadoSQL;
  // Stores action output result for [Custom Action - coverColorPicker] action in Disc widget.
  List<Color>? coloresGenerados;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // Stores action output result for [Backend Call - SQLite (listSongsAlbum)] action in Container widget.
  List<ListSongsAlbumRow>? listaReproduccionAlbum;
  // Stores action output result for [Custom Action - coverColorPicker] action in Container widget.
  List<Color>? colorElegido;
  // Model for bottomMenu component.
  late BottomMenuModel bottomMenuModel;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    bottomMenuModel = createModel(context, () => BottomMenuModel());
  }

  @override
  void dispose() {
    columnController?.dispose();
    bottomMenuModel.dispose();
  }
}
