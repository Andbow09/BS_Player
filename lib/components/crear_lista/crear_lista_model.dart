import '/flutter_flow/flutter_flow_util.dart';
import 'crear_lista_widget.dart' show CrearListaWidget;
import 'package:flutter/material.dart';

class CrearListaModel extends FlutterFlowModel<CrearListaWidget> {
  ///  Local state fields for this component.

  FFUploadedFile? imagenTemp;

  ///  State fields for stateful widgets in this component.

  bool isDataUploading_uploadDataWg5 = false;
  FFUploadedFile uploadedLocalFile_uploadDataWg5 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - guardarImagenLocal] action in Container widget.
  String? rutaPermanente;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
