import '/backend/schema/structs/index.dart';
import '/components/top_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
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

  // Stores action output result for [Custom Action - obtenerCanciones] action in HomePage widget.
  List<CancionStruct>? resultadoEscaneo;
  // Model for topMenu component.
  late TopMenuModel topMenuModel;

  @override
  void initState(BuildContext context) {
    topMenuModel = createModel(context, () => TopMenuModel());
  }

  @override
  void dispose() {
    topMenuModel.dispose();
  }
}
