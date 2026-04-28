import '/backend/sqlite/sqlite_manager.dart';
import '/components/bottom_menu/bottom_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'disc_widget.dart' show DiscWidget;
import 'package:flutter/material.dart';

class DiscModel extends FlutterFlowModel<DiscWidget> {
  ///  State fields for stateful widgets in this page.

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
