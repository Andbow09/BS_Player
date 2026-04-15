import '/backend/sqlite/sqlite_manager.dart';
import '/components/main_player/main_player_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
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
        Container(
          width: double.infinity,
          height: FFAppState().currentTitle != ''
              ? 180.0
              : 70.0,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [
                valueOrDefault<Color>(
                  FFAppState().currentColor,
                  Color(0xFF6C7F87),
                ),
                valueOrDefault<Color>(
                  FFAppState().currentDarkColor,
                  Color(0xFF253031),
                ),
                Colors.black
              ],
              stops: [0.0, 0.3, 1.0],
              center: Alignment(1.0, 1.0),
              radius: 9.0,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(valueOrDefault<double>(
                FFAppState().currentTitle != ''
                    ? 20.0
                    : 29.0,
                0.0,
              )),
              topRight: Radius.circular(valueOrDefault<double>(
                FFAppState().currentTitle != ''
                    ? 20.0
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                                          'Battle! VS Pokémon Trainer',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Metropolis 2',
                                              color: Colors.white,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    Text(
                                      valueOrDefault<String>(
                                        FFAppState().currentArtist,
                                        'Game Freak',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Metropolis 2',
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ].divide(SizedBox(height: 7.0)),
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 10.0, 4.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 10.0,
                    child: custom_widgets.MiniBar(
                      width: double.infinity,
                      height: 10.0,
                      colorActivo: Colors.white,
                      colorFondo: Color(0x827B7B7B),
                      onSongEnding: () async {
                        if (FFAppState().loopMode == 2) {
                          await actions.audioController(
                            'play',
                            FFAppState()
                                .colaRutas
                                .elementAtOrNull(FFAppState().currentIndex),
                          );
                        } else {
                          if (FFAppState().currentIndex <
                              (FFAppState().colaIds.length - 1)) {
                            FFAppState().currentIndex =
                                FFAppState().currentIndex + 1;
                            safeSetState(() {});
                            FFAppState().currentId = FFAppState()
                                .colaIds
                                .elementAtOrNull(FFAppState().currentIndex)!;
                            FFAppState().currentTitle = FFAppState()
                                .colaTitulos
                                .elementAtOrNull(FFAppState().currentIndex)!;
                            FFAppState().currentArtist = FFAppState()
                                .colaArtistas
                                .elementAtOrNull(FFAppState().currentIndex)!;
                            FFAppState().currentAlbum = FFAppState()
                                .colaAlbums
                                .elementAtOrNull(FFAppState().currentIndex)!;
                            safeSetState(() {});
                            await Future.delayed(
                              Duration(
                                milliseconds: 100,
                              ),
                            );
                            await actions.audioController(
                              'play',
                              FFAppState()
                                  .colaRutas
                                  .elementAtOrNull(FFAppState().currentIndex),
                            );
                            _model.pickedColor = await actions.coverColorPicker(
                              FFAppState().currentId,
                              FFAppState()
                                  .colaColores
                                  .elementAtOrNull(FFAppState().currentIndex),
                            );
                            FFAppState().currentColor =
                                (_model.pickedColor!.elementAtOrNull(0))!;
                            FFAppState().currentDarkColor =
                                (_model.pickedColor!.elementAtOrNull(1))!;
                            safeSetState(() {});
                            if (FFAppState().colaColores.elementAtOrNull(
                                    FFAppState().currentIndex) ==
                                0) {
                              await SQLiteManager.instance.updateColor(
                                color: functions.colorToInt(
                                    (_model.pickedColor!.elementAtOrNull(0))!),
                                id: FFAppState().currentId,
                              );
                              FFAppState().updateColaColoresAtIndex(
                                FFAppState().currentIndex,
                                (_) => functions.colorToInt(
                                    (_model.pickedColor!.elementAtOrNull(0))!),
                              );
                              safeSetState(() {});
                            }
                          } else {
                            if (FFAppState().loopMode == 1) {
                              FFAppState().currentIndex = 0;
                              safeSetState(() {});
                              FFAppState().currentId = FFAppState()
                                  .colaIds
                                  .elementAtOrNull(FFAppState().currentIndex)!;
                              FFAppState().currentTitle = FFAppState()
                                  .colaTitulos
                                  .elementAtOrNull(FFAppState().currentIndex)!;
                              FFAppState().currentArtist = FFAppState()
                                  .colaArtistas
                                  .elementAtOrNull(FFAppState().currentIndex)!;
                              FFAppState().currentAlbum = FFAppState()
                                  .colaAlbums
                                  .elementAtOrNull(FFAppState().currentIndex)!;
                              safeSetState(() {});
                              await Future.delayed(
                                Duration(
                                  milliseconds: 100,
                                ),
                              );
                              await actions.audioController(
                                'play',
                                FFAppState()
                                    .colaRutas
                                    .elementAtOrNull(FFAppState().currentIndex),
                              );
                              _model.pickedColor2 =
                                  await actions.coverColorPicker(
                                FFAppState().currentId,
                                FFAppState()
                                    .colaColores
                                    .elementAtOrNull(FFAppState().currentIndex),
                              );
                              FFAppState().currentColor =
                                  (_model.pickedColor2!.elementAtOrNull(0))!;
                              FFAppState().currentDarkColor =
                                  (_model.pickedColor2!.elementAtOrNull(1))!;
                              safeSetState(() {});
                              if (FFAppState().colaColores.elementAtOrNull(
                                      FFAppState().currentIndex) ==
                                  0) {
                                await SQLiteManager.instance.updateColor(
                                  color: functions.colorToInt((_model
                                      .pickedColor2!
                                      .elementAtOrNull(0))!),
                                  id: FFAppState().currentId,
                                );
                                FFAppState().updateColaColoresAtIndex(
                                  FFAppState().currentIndex,
                                  (_) => functions.colorToInt((_model
                                      .pickedColor2!
                                      .elementAtOrNull(0))!),
                                );
                                safeSetState(() {});
                              }
                            }
                          }
                        }

                        safeSetState(() {});
                      },
                    ),
                  ),
                ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
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
                                    ? FFAppState().currentDarkColor
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
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 0.0, 0.0),
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
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
