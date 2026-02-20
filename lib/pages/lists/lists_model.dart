import '/backend/schema/structs/index.dart';
import '/components/bottom_menu/bottom_menu_widget.dart';
import '/components/top_menu/top_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'lists_widget.dart' show ListsWidget;
import 'package:flutter/material.dart';

class ListsModel extends FlutterFlowModel<ListsWidget> {
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

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - obtenerCanciones] action in Lists widget.
  List<CancionStruct>? resultadoEscaneo;
  // Model for topMenu component.
  late TopMenuModel topMenuModel;
  // Model for bottomMenu component.
  late BottomMenuModel bottomMenuModel;

  @override
  void initState(BuildContext context) {
    topMenuModel = createModel(context, () => TopMenuModel());
    bottomMenuModel = createModel(context, () => BottomMenuModel());
  }

  @override
  void dispose() {
    topMenuModel.dispose();
    bottomMenuModel.dispose();
  }
}
