import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bottom_menu_model.dart';
export 'bottom_menu_model.dart';

class BottomMenuWidget extends StatefulWidget {
  const BottomMenuWidget({
    super.key,
    String? page,
    this.titulo,
    this.artista,
    this.id,
    this.album,
    this.ruta,
  }) : this.page = page ?? 'Canciones';

  final String page;
  final String? titulo;
  final String? artista;
  final int? id;
  final String? album;
  final String? ruta;

  @override
  State<BottomMenuWidget> createState() => _BottomMenuWidgetState();
}

class _BottomMenuWidgetState extends State<BottomMenuWidget> {
  late BottomMenuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomMenuModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 400),
          curve: Curves.easeIn,
          width: double.infinity,
          height: FFAppState().currentTitle != ''
              ? 130.0
              : 0.0,
          decoration: BoxDecoration(
            color: FFAppState().currentColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(35.0),
              topRight: Radius.circular(35.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 0.0, 20.0),
                    child: Container(
                      width: 65.0,
                      height: 65.0,
                      child: custom_widgets.SongCover(
                        width: 65.0,
                        height: 65.0,
                        cancionId: valueOrDefault<int>(
                          FFAppState().currentId,
                          0,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(90.0, 27.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              FFAppState().currentTitle,
                              'titulo',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FFAppState().currentTextColor,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            valueOrDefault<String>(
                              FFAppState().currentArtist,
                              'artista',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FontStyle.italic,
                                  ),
                                  color: FFAppState().currentTextColor,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FontStyle.italic,
                                ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              FFAppState().currentAlbum,
                              'album',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FFAppState().currentTextColor,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 28.0, 18.0, 0.0),
                      child: Stack(
                        alignment: AlignmentDirectional(1.0, 0.0),
                        children: [
                          if (FFAppState().isPlaying == true)
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await actions.audioController(
                                  'pause',
                                  '',
                                );
                                FFAppState().isPlaying = false;
                                safeSetState(() {});
                              },
                              child: Icon(
                                Icons.pause_rounded,
                                color: FFAppState().currentTextColor,
                                size: 50.0,
                              ),
                            ),
                          if (FFAppState().isPlaying == false)
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await actions.audioController(
                                  'resume',
                                  '',
                                );
                                FFAppState().isPlaying = true;
                                safeSetState(() {});
                              },
                              child: Icon(
                                Icons.play_arrow_rounded,
                                color: FFAppState().currentTextColor,
                                size: 50.0,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 85.0, 20.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 20.0,
                        child: custom_widgets.MiniBar(
                          width: double.infinity,
                          height: 20.0,
                          colorActivo: FFAppState().currentDarkColor,
                          colorFondo: FFAppState().currentLightColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 0.0),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            width: double.infinity,
            height: 70.0,
            decoration: BoxDecoration(
              color: FFAppState().currentColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(valueOrDefault<double>(
                  FFAppState().currentTitle != ''
                      ? 35.0
                      : 50.0,
                  0.0,
                )),
                bottomRight: Radius.circular(valueOrDefault<double>(
                  FFAppState().currentTitle != ''
                      ? 35.0
                      : 50.0,
                  0.0,
                )),
                topLeft: Radius.circular(valueOrDefault<double>(
                  FFAppState().currentTitle != ''
                      ? 0.0
                      : 50.0,
                  0.0,
                )),
                topRight: Radius.circular(valueOrDefault<double>(
                  FFAppState().currentTitle != ''
                      ? 0.0
                      : 50.0,
                  0.0,
                )),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 45.0,
                  height: 45.0,
                  decoration: BoxDecoration(
                    color: widget.page == 'songs'
                        ? Colors.white
                        : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (widget.page != 'songs') {
                        context.pushNamed(SongsWidget.routeName);
                      }
                    },
                    child: Icon(
                      Icons.music_note,
                      color: FFAppState().currentTextColor,
                      size: 30.0,
                    ),
                  ),
                ),
                Container(
                  width: 45.0,
                  height: 45.0,
                  decoration: BoxDecoration(
                    color: widget.page == 'discs'
                        ? Colors.white
                        : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (widget.page != 'discs') {
                        context.pushNamed(DiscsWidget.routeName);
                      }
                    },
                    child: Icon(
                      Icons.album,
                      color: FFAppState().currentTextColor,
                      size: 30.0,
                    ),
                  ),
                ),
                Container(
                  width: 45.0,
                  height: 45.0,
                  decoration: BoxDecoration(
                    color: widget.page == 'search'
                        ? Colors.white
                        : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (widget.page != 'search') {
                        context.pushNamed(SearchWidget.routeName);
                      }
                    },
                    child: Icon(
                      Icons.search,
                      color: FFAppState().currentTextColor,
                      size: 30.0,
                    ),
                  ),
                ),
                Container(
                  width: 45.0,
                  height: 45.0,
                  decoration: BoxDecoration(
                    color: widget.page == 'lists'
                        ? Colors.white
                        : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (widget.page != 'lists') {
                          context.pushNamed(ListsWidget.routeName);
                        }
                      },
                      child: Icon(
                        Icons.playlist_play_rounded,
                        color: FFAppState().currentTextColor,
                        size: 35.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 45.0,
                  height: 45.0,
                  decoration: BoxDecoration(
                    color: widget.page == 'artists'
                        ? Colors.white
                        : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (widget.page != 'artists') {
                        context.pushNamed(ArtistsWidget.routeName);
                      }
                    },
                    child: Icon(
                      Icons.person_rounded,
                      color: FFAppState().currentTextColor,
                      size: 30.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
