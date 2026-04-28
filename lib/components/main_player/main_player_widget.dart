import '/backend/sqlite/sqlite_manager.dart';
import '/components/playlist/playlist_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'main_player_model.dart';
export 'main_player_model.dart';

class MainPlayerWidget extends StatefulWidget {
  const MainPlayerWidget({super.key});

  @override
  State<MainPlayerWidget> createState() => _MainPlayerWidgetState();
}

class _MainPlayerWidgetState extends State<MainPlayerWidget>
    with TickerProviderStateMixin {
  late MainPlayerModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainPlayerModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });
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
        gradient: RadialGradient(
          colors: [
            valueOrDefault<Color>(
              FFAppState().currentColor,
              FlutterFlowTheme.of(context).secondary,
            ),
            valueOrDefault<Color>(
              FFAppState().currentDarkColor,
              Color(0xFF1B4B47),
            ),
            Colors.black
          ],
          stops: [0.0, 0.25, 1.0],
          center: Alignment(0.0, -0.5),
          radius: 2.5,
        ),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30.0, 100.0, 30.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 320.0,
                  child: custom_widgets.BigSongCover(
                    width: double.infinity,
                    height: 320.0,
                    cancionId: FFAppState().currentId,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                30.0, 0.0, 30.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                FFAppState().currentTitle,
                                'Battle! VS Pokémon Trainer',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Metropolis 2',
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                30.0, 5.0, 30.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                FFAppState().currentArtist,
                                'Game Freak',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Metropolis 2',
                                    color: Color(0xFFD7D7D7),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ),
                      ],
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(14.0, 15.0, 14.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 50.0,
                  child: custom_widgets.MiniBar(
                    width: double.infinity,
                    height: 50.0,
                    colorActivo: Colors.white,
                    colorFondo: Color(0x40808080),
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
                              (_model.colorPicked!.elementAtOrNull(0))!;
                          FFAppState().currentDarkColor =
                              (_model.colorPicked!.elementAtOrNull(1))!;
                          safeSetState(() {});
                          if (FFAppState()
                                  .colaColores
                                  .elementAtOrNull(FFAppState().currentIndex) ==
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
                          _model.forceRebuild = _model.forceRebuild! + 1;
                          safeSetState(() {});
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
                                (_model.colorPicked!.elementAtOrNull(0))!;
                            FFAppState().currentDarkColor =
                                (_model.colorPicked!.elementAtOrNull(1))!;
                            safeSetState(() {});
                            if (FFAppState().colaColores.elementAtOrNull(
                                    FFAppState().currentIndex) ==
                                0) {
                              await SQLiteManager.instance.updateColor(
                                color: functions.colorToInt(
                                    (_model.pickedColor2!.elementAtOrNull(0))!),
                                id: FFAppState().currentId,
                              );
                              FFAppState().updateColaColoresAtIndex(
                                FFAppState().currentIndex,
                                (_) => functions.colorToInt(
                                    (_model.pickedColor2!.elementAtOrNull(0))!),
                              );
                              safeSetState(() {});
                            }
                            _model.forceRebuild = _model.forceRebuild! + 1;
                            safeSetState(() {});
                          }
                        }
                      }

                      safeSetState(() {});
                    },
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
                            if (FFAppState().loopMode == 0)
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().loopMode =
                                      (FFAppState().loopMode + 1) % 3;
                                  safeSetState(() {});
                                },
                                child: Icon(
                                  Icons.repeat_rounded,
                                  color: Color(0x40808080),
                                  size: 35.0,
                                ),
                              ),
                            if (FFAppState().loopMode == 1)
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().loopMode =
                                      (FFAppState().loopMode + 1) % 3;
                                  safeSetState(() {});
                                },
                                child: Icon(
                                  Icons.repeat_rounded,
                                  color: Colors.white,
                                  size: 35.0,
                                ),
                              ),
                            if (FFAppState().loopMode == 2)
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().loopMode =
                                      (FFAppState().loopMode + 1) % 3;
                                  safeSetState(() {});
                                },
                                child: Icon(
                                  Icons.repeat_one_rounded,
                                  color: Colors.white,
                                  size: 35.0,
                                ),
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
                            width: 60.0,
                            height: 60.0,
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
                                      size: 50.0,
                                    ),
                                  ),
                                if (FFAppState().isPlaying == true)
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Icon(
                                      Icons.pause_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 50.0,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 2.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await actions.toggleShuffle();

                              safeSetState(() {});
                            },
                            child: FaIcon(
                              FontAwesomeIcons.random,
                              color: FFAppState().isShuffleOn == true
                                  ? Colors.white
                                  : Color(0x40808080),
                              size: 30.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 50.0, 0.0),
                          child: InkWell(
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
                                    .elementAtOrNull(
                                        FFAppState().currentIndex)!;
                                FFAppState().currentId = FFAppState()
                                    .colaIds
                                    .elementAtOrNull(
                                        FFAppState().currentIndex)!;
                                FFAppState().currentArtist = FFAppState()
                                    .colaArtistas
                                    .elementAtOrNull(
                                        FFAppState().currentIndex)!;
                                FFAppState().currentAlbum = FFAppState()
                                    .colaAlbums
                                    .elementAtOrNull(
                                        FFAppState().currentIndex)!;
                                safeSetState(() {});
                                _model.colorPickedPrevious =
                                    await actions.coverColorPicker(
                                  FFAppState().currentId,
                                  FFAppState().colaColores.elementAtOrNull(
                                      FFAppState().currentIndex),
                                );
                                FFAppState().currentColor = (_model
                                    .colorPickedPrevious!
                                    .elementAtOrNull(0))!;
                                FFAppState().currentDarkColor = (_model
                                    .colorPickedPrevious!
                                    .elementAtOrNull(1))!;
                                safeSetState(() {});
                                await actions.audioController(
                                  'play',
                                  FFAppState().colaRutas.elementAtOrNull(
                                      FFAppState().currentIndex),
                                );
                                if (FFAppState().colaColores.elementAtOrNull(
                                        FFAppState().currentIndex) ==
                                    0) {
                                  await SQLiteManager.instance.updateColor(
                                    color: functions.colorToInt((_model
                                        .colorPickedPrevious!
                                        .elementAtOrNull(0))!),
                                    id: FFAppState().currentId,
                                  );
                                  FFAppState().updateColaColoresAtIndex(
                                    FFAppState().currentIndex,
                                    (_) => functions.colorToInt((_model
                                        .colorPickedPrevious!
                                        .elementAtOrNull(0))!),
                                  );
                                  safeSetState(() {});
                                }
                              }

                              safeSetState(() {});
                            },
                            child: Icon(
                              Icons.skip_previous_rounded,
                              color: Colors.white,
                              size: 40.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              50.0, 0.0, 0.0, 0.0),
                          child: InkWell(
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
                                    .elementAtOrNull(
                                        FFAppState().currentIndex)!;
                                FFAppState().currentId = FFAppState()
                                    .colaIds
                                    .elementAtOrNull(
                                        FFAppState().currentIndex)!;
                                FFAppState().currentArtist = FFAppState()
                                    .colaArtistas
                                    .elementAtOrNull(
                                        FFAppState().currentIndex)!;
                                FFAppState().currentAlbum = FFAppState()
                                    .colaAlbums
                                    .elementAtOrNull(
                                        FFAppState().currentIndex)!;
                                safeSetState(() {});
                                _model.colorPicked =
                                    await actions.coverColorPicker(
                                  FFAppState().currentId,
                                  FFAppState().colaColores.elementAtOrNull(
                                      FFAppState().currentIndex),
                                );
                                FFAppState().currentColor =
                                    (_model.colorPicked!.elementAtOrNull(0))!;
                                FFAppState().currentDarkColor =
                                    (_model.colorPicked!.elementAtOrNull(1))!;
                                safeSetState(() {});
                                await actions.audioController(
                                  'play',
                                  FFAppState().colaRutas.elementAtOrNull(
                                      FFAppState().currentIndex),
                                );
                                if (FFAppState().colaColores.elementAtOrNull(
                                        FFAppState().currentIndex) ==
                                    0) {
                                  await SQLiteManager.instance.updateColor(
                                    color: functions.colorToInt((_model
                                        .colorPicked!
                                        .elementAtOrNull(0))!),
                                    id: FFAppState().currentId,
                                  );
                                  FFAppState().updateColaColoresAtIndex(
                                    FFAppState().currentIndex,
                                    (_) => functions.colorToInt((_model
                                        .colorPicked!
                                        .elementAtOrNull(0))!),
                                  );
                                  safeSetState(() {});
                                }
                              }

                              safeSetState(() {});
                            },
                            child: Icon(
                              Icons.skip_next_rounded,
                              color: Colors.white,
                              size: 40.0,
                            ),
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
                        InkWell(
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
                                  child: PlaylistWidget(),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                          child: Icon(
                            Icons.playlist_play_rounded,
                            color: Colors.white,
                            size: 35.0,
                          ),
                        ),
                        Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(17.0, 49.0, 0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                Navigator.pop(context);
              },
              child: FaIcon(
                FontAwesomeIcons.angleDown,
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
                        EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                    child: Text(
                      valueOrDefault<String>(
                        FFAppState().currentAlbum,
                        'Pokémon: Black/White',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Metropolis 2',
                            color: Colors.white,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
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
    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
  }
}
