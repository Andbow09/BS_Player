import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/components/bottom_menu/bottom_menu_widget.dart';
import '/components/top_menu/top_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'songs_widget.dart' show SongsWidget;
import 'package:flutter/material.dart';

class SongsModel extends FlutterFlowModel<SongsWidget> {
  ///  Local state fields for this page.

  List<CancionStruct> listaCanciones = [];
  void addToListaCanciones(CancionStruct item) => listaCanciones.add(item);
  void removeFromListaCanciones(CancionStruct item) =>
      listaCanciones.remove(item);
  void removeAtIndexFromListaCanciones(int index) =>
      listaCanciones.removeAt(index);
  void insertAtIndexInListaCanciones(int index, CancionStruct item) =>
      listaCanciones.insert(index, item);
  void updateListaCancionesAtIndex(
          int index, Function(CancionStruct) updateFn) =>
      listaCanciones[index] = updateFn(listaCanciones[index]);

  bool estaCargando = true;

  ///  State fields for stateful widgets in this page.

  // Model for topMenu component.
  late TopMenuModel topMenuModel;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Custom Action - coverColorPicker] action in Container widget.
  List<Color>? pickedColor;
  // Stores action output result for [Backend Call - SQLite (getRandomSong)] action in Container widget.
  List<GetRandomSongRow>? fullyRandomizedPlaylist;
  // Stores action output result for [Custom Action - coverColorPicker] action in Container widget.
  List<Color>? fullyRandomizedPickedColor;
  // Model for bottomMenu component.
  late BottomMenuModel bottomMenuModel;

  @override
  void initState(BuildContext context) {
    topMenuModel = createModel(context, () => TopMenuModel());
    columnController = ScrollController();
    bottomMenuModel = createModel(context, () => BottomMenuModel());
  }

  @override
  void dispose() {
    topMenuModel.dispose();
    columnController?.dispose();
    bottomMenuModel.dispose();
  }
}
