import '/components/bottom_menu/bottom_menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'main_player_model.dart';
export 'main_player_model.dart';

class MainPlayerWidget extends StatefulWidget {
  const MainPlayerWidget({super.key});

  @override
  State<MainPlayerWidget> createState() => _MainPlayerWidgetState();
}

class _MainPlayerWidgetState extends State<MainPlayerWidget> {
  late MainPlayerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainPlayerModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            valueOrDefault<Color>(
              FFAppState().currentColor,
              FlutterFlowTheme.of(context).secondary,
            ),
            Color(0xFF111517)
          ],
          stops: [0.0, 1.0],
          begin: AlignmentDirectional(0.0, -1.0),
          end: AlignmentDirectional(0, 1.0),
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 250.0,
                    child: custom_widgets.SongCover(
                      width: double.infinity,
                      height: 250.0,
                      cancionId: FFAppState().currentId,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Text(
                      FFAppState().currentTitle,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.golosText(
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: Colors.white,
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Text(
                    FFAppState().currentArtist,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.golosText(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FontStyle.italic,
                          ),
                          color: Colors.white,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle: FontStyle.italic,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 50.0,
                    child: custom_widgets.MiniBar(
                      width: double.infinity,
                      height: 50.0,
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        Icon(
                          Icons.repeat_rounded,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        Icon(
                          Icons.repeat_one_rounded,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        Icon(
                          Icons.repeat_rounded,
                          color: Color(0xFF808080),
                          size: 30.0,
                        ),
                      ],
                    ),
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        shape: BoxShape.circle,
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Icon(
                              Icons.play_arrow_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 40.0,
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Icon(
                              Icons.pause_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 40.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.random,
                          color: Color(0xFF808080),
                          size: 24.0,
                        ),
                        FaIcon(
                          FontAwesomeIcons.random,
                          color: Colors.white,
                          size: 24.0,
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.playlist_play_rounded,
                            color: Colors.white,
                            size: 30.0,
                          ),
                          Stack(
                            children: [
                              Icon(
                                Icons.favorite_border_rounded,
                                color: Colors.white,
                                size: 30.0,
                              ),
                              Icon(
                                Icons.favorite_rounded,
                                color: Colors.white,
                                size: 30.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 7.0, 0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: BottomMenuWidget(
                        page: FFAppState().currentPage,
                      ),
                    );
                  },
                ).then((value) => safeSetState(() {}));
              },
              child: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.white,
                size: 30.0,
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Container(
              width: 200.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: Color(0x00FFFFFF),
              ),
              child: Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: Text(
                    'Hello World',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.golosText(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: Colors.white,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
