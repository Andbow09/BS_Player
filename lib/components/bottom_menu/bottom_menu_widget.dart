import '/backend/sqlite/sqlite_manager.dart';
import '/components/main_player/main_player_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bottom_menu_model.dart';
export 'bottom_menu_model.dart';

class BottomMenuWidget extends StatefulWidget {
  const BottomMenuWidget({
    super.key,
    required this.page,
  });

  final String? page;

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

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (FFAppState().currentTitle != '')
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (FFAppState().currentTitle != '')
                Stack(
                  children: [
                    if (FFAppState().currentTitle != '')
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              90.0, 30.0, 70.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: Visibility(
                              visible: FFAppState().currentTitle != '',
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
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: MainPlayerWidget(),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (FFAppState().currentTitle != '')
                                      Text(
                                        valueOrDefault<String>(
                                          FFAppState().currentTitle,
                                          'titulo',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.golosText(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
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
                                            font: GoogleFonts.golosText(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle: FontStyle.italic,
                                            ),
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle: FontStyle.italic,
                                          ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (FFAppState().currentTitle != '')
                      Align(
                        alignment: AlignmentDirectional(1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 21.0, 20.0, 0.0),
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
                                    color: Colors.white,
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
                                    color: Colors.white,
                                    size: 50.0,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    if (FFAppState().currentTitle != '')
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 0.0, 0.0),
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
                                  child: MainPlayerWidget(),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                          child: Container(
                            width: 55.0,
                            height: 55.0,
                            child: custom_widgets.MiniSongCover(
                              width: 55.0,
                              height: 55.0,
                              cancionId: FFAppState().currentId,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              if (FFAppState().currentTitle != '')
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(3.0, 10.0, 3.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: 10.0,
                      child: custom_widgets.MiniBar(
                        width: double.infinity,
                        height: 10.0,
                        colorActivo: Colors.white,
                        colorFondo: Color(0x40808080),
                        onSongEnding: () async {
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
                                .colaAlbums
                                .elementAtOrNull(FFAppState().currentIndex)!;
                            safeSetState(() {});
                            _model.colorPicked = await actions.coverColorPicker(
                              FFAppState().currentId,
                              FFAppState()
                                  .colaColores
                                  .elementAtOrNull(FFAppState().currentIndex),
                            );
                            FFAppState().currentColor =
                                (_model.colorPicked!.elementAtOrNull(0))!;
                            safeSetState(() {});
                            await actions.audioController(
                              'play',
                              FFAppState()
                                  .colaRutas
                                  .elementAtOrNull(FFAppState().currentIndex),
                            );
                            if (FFAppState().colaColores.elementAtOrNull(
                                    FFAppState().currentIndex) ==
                                0) {
                              await SQLiteManager.instance.updateColor(
                                color: functions.colorToInt(
                                    (_model.colorPicked!.elementAtOrNull(0))!),
                                id: FFAppState().currentId,
                              );
                              FFAppState().updateColaColoresAtIndex(
                                FFAppState().currentIndex,
                                (_) => functions.colorToInt(
                                    (_model.colorPicked!.elementAtOrNull(0))!),
                              );
                              safeSetState(() {});
                            }
                          }

                          safeSetState(() {});
                        },
                      ),
                    ),
                  ),
                ),
            ],
          ),
        Container(
          width: double.infinity,
          height: FFAppState().currentTitle != ''
              ? 180.0
              : 70.0,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [
                Color(0xE620272A),
                valueOrDefault<Color>(
                  FFAppState().currentDarkColor,
                  Color(0xFF344145),
                ),
                valueOrDefault<Color>(
                  FFAppState().currentColor,
                  Color(0xFF6C7F87),
                )
              ],
              stops: [0.0, 0.3, 1.0],
              center: Alignment(-1.0, -1.0),
              radius: 15.0,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(valueOrDefault<double>(
                FFAppState().currentTitle != ''
                    ? 0.0
                    : 29.0,
                0.0,
              )),
              topRight: Radius.circular(valueOrDefault<double>(
                FFAppState().currentTitle != ''
                    ? 0.0
                    : 29.0,
                0.0,
              )),
              bottomLeft: Radius.circular(valueOrDefault<double>(
                FFAppState().currentTitle != ''
                    ? 20.0
                    : 29.0,
                0.0,
              )),
              bottomRight: Radius.circular(valueOrDefault<double>(
                FFAppState().currentTitle != ''
                    ? 20.0
                    : 29.0,
                0.0,
              )),
            ),
            border: Border.all(
              color: Color(0x848A8A8A),
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
                    if (FFAppState().currentPage != 'songs') {
                      context.pushNamed(SongsWidget.routeName);

                      FFAppState().currentPage = 'songs';
                      safeSetState(() {});
                    }
                  },
                  child: Icon(
                    Icons.music_note,
                    color: widget.page == 'songs'
                        ? FFAppState().currentTextColor
                        : Colors.white,
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
                    if (FFAppState().currentPage != 'discs') {
                      context.pushNamed(DiscsWidget.routeName);

                      FFAppState().currentPage = 'discs';
                      safeSetState(() {});
                    }
                  },
                  child: Icon(
                    Icons.album,
                    color: widget.page == 'discs'
                        ? FFAppState().currentTextColor
                        : Colors.white,
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
                    if (FFAppState().currentPage != 'search') {
                      context.pushNamed(SearchWidget.routeName);

                      FFAppState().currentPage = 'search';
                      safeSetState(() {});
                    }
                  },
                  child: Icon(
                    Icons.search,
                    color: widget.page == 'search'
                        ? FFAppState().currentTextColor
                        : Colors.white,
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
                      if (FFAppState().currentPage != 'lists') {
                        context.pushNamed(ListsWidget.routeName);

                        FFAppState().currentPage = 'lists';
                        safeSetState(() {});
                      }
                    },
                    child: Icon(
                      Icons.playlist_play_rounded,
                      color: widget.page == 'lists'
                          ? FFAppState().currentTextColor
                          : Colors.white,
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
                    if (FFAppState().currentPage != 'artists') {
                      context.pushNamed(ArtistsWidget.routeName);

                      FFAppState().currentPage = 'artists';
                      safeSetState(() {});
                    }
                  },
                  child: Icon(
                    Icons.person_rounded,
                    color: widget.page == 'artists'
                        ? FFAppState().currentTextColor
                        : Colors.white,
                    size: 30.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
