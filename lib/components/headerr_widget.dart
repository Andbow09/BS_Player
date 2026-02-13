import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'headerr_model.dart';
export 'headerr_model.dart';

class HeaderrWidget extends StatefulWidget {
  const HeaderrWidget({super.key});

  @override
  State<HeaderrWidget> createState() => _HeaderrWidgetState();
}

class _HeaderrWidgetState extends State<HeaderrWidget> {
  late HeaderrModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeaderrModel());
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
