import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
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
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30.0, 90.0, 30.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 325.0,
                  child: custom_widgets.BigSongCover(
                    width: double.infinity,
                    height: 325.0,
                    cancionId: FFAppState().currentId,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(30.0, 15.0, 30.0, 0.0),
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
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30.0, 5.0, 30.0, 0.0),
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
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 50.0,
                  child: custom_widgets.MiniBar(
                    width: double.infinity,
                    height: 50.0,
                    colorActivo: FFAppState().currentDarkColor,
                    colorFondo: FFAppState().currentLightColor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30.0, 10.0, 30.0, 0.0),
                child: Stack(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          children: [
                            Icon(
                              Icons.repeat_rounded,
                              color: Colors.white,
                              size: 35.0,
                            ),
                            Icon(
                              Icons.repeat_one_rounded,
                              color: Colors.white,
                              size: 35.0,
                            ),
                            Icon(
                              Icons.repeat_rounded,
                              color: Color(0xFF808080),
                              size: 35.0,
                            ),
                          ],
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (FFAppState().isPlaying == true) {
                              await actions.audioController(
                                'pause',
                                '',
                              );
                              FFAppState().isPlaying = false;
                              safeSetState(() {});
                            } else {
                              await actions.audioController(
                                'resume',
                                '',
                              );
                              FFAppState().isPlaying = true;
                              safeSetState(() {});
                            }
                          },
                          child: Container(
                            width: 65.0,
                            height: 65.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              shape: BoxShape.circle,
                            ),
                            child: Stack(
                              children: [
                                if (FFAppState().isPlaying == false)
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Icon(
                                      Icons.play_arrow_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 55.0,
                                    ),
                                  ),
                                if (FFAppState().isPlaying == true)
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Icon(
                                      Icons.pause_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 55.0,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Stack(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.random,
                              color: Color(0xFF808080),
                              size: 30.0,
                            ),
                            FaIcon(
                              FontAwesomeIcons.random,
                              color: Colors.white,
                              size: 30.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (FFAppState().currentIndex > 0) {
                              FFAppState().currentIndex =
                                  FFAppState().currentIndex + -1;
                              FFAppState().currentTitle = FFAppState()
                                  .colaTitulos
                                  .elementAtOrNull(FFAppState().currentIndex)!;
                              FFAppState().currentId = FFAppState()
                                  .colaIds
                                  .elementAtOrNull(FFAppState().currentIndex)!;
                              FFAppState().currentArtist = FFAppState()
                                  .colaArtistas
                                  .elementAtOrNull(FFAppState().currentIndex)!;
                              FFAppState().currentAlbum = FFAppState()
                                  .currentAlbums
                                  .elementAtOrNull(FFAppState().currentIndex)!;
                              safeSetState(() {});
                              await actions.audioController(
                                'play',
                                FFAppState()
                                    .colaRutas
                                    .elementAtOrNull(FFAppState().currentIndex),
                              );
                            }
                          },
                          child: Icon(
                            Icons.skip_previous_rounded,
                            color: Colors.white,
                            size: 45.0,
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (FFAppState().currentIndex <
                                FFAppState().colaRutas.length) {
                              FFAppState().currentIndex =
                                  FFAppState().currentIndex + 1;
                              FFAppState().currentTitle = FFAppState()
                                  .colaTitulos
                                  .elementAtOrNull(FFAppState().currentIndex)!;
                              FFAppState().currentId = FFAppState()
                                  .colaIds
                                  .elementAtOrNull(FFAppState().currentIndex)!;
                              FFAppState().currentArtist = FFAppState()
                                  .colaArtistas
                                  .elementAtOrNull(FFAppState().currentIndex)!;
                              FFAppState().currentAlbum = FFAppState()
                                  .currentAlbums
                                  .elementAtOrNull(FFAppState().currentIndex)!;
                              FFAppState().currentColor = Color(0x00000000);
                              safeSetState(() {});
                              _model.colorPicked =
                                  await actions.coverColorPicker(
                                FFAppState().currentId,
                              );
                              FFAppState().currentColor =
                                  (_model.colorPicked!.elementAtOrNull(0))!;
                              FFAppState().currentLightColor =
                                  (_model.colorPicked!.elementAtOrNull(1))!;
                              FFAppState().currentDarkColor =
                                  (_model.colorPicked!.elementAtOrNull(2))!;
                              safeSetState(() {});
                              await actions.audioController(
                                'play',
                                FFAppState()
                                    .colaRutas
                                    .elementAtOrNull(FFAppState().currentIndex),
                              );
                            }

                            safeSetState(() {});
                          },
                          child: Icon(
                            Icons.skip_next_rounded,
                            color: Colors.white,
                            size: 45.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 75.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.playlist_play_rounded,
                          color: Colors.white,
                          size: 40.0,
                        ),
                        Stack(
                          children: [
                            Icon(
                              Icons.favorite_border_rounded,
                              color: Colors.white,
                              size: 35.0,
                            ),
                            Icon(
                              Icons.favorite_rounded,
                              color: Colors.white,
                              size: 35.0,
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
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 37.0, 0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                Navigator.pop(context);
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
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
              child: Container(
                width: 200.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Color(0x00FFFFFF),
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: Text(
                      FFAppState().currentAlbum,
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
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                      overflow: TextOverflow.ellipsis,
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
