import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'headerrr_model.dart';
export 'headerrr_model.dart';

class HeaderrrWidget extends StatefulWidget {
  const HeaderrrWidget({super.key});

  @override
  State<HeaderrrWidget> createState() => _HeaderrrWidgetState();
}

class _HeaderrrWidgetState extends State<HeaderrrWidget> {
  late HeaderrrModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeaderrrModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
