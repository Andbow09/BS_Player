import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'playlist_model.dart';
export 'playlist_model.dart';

class PlaylistWidget extends StatefulWidget {
  const PlaylistWidget({super.key});

  @override
  State<PlaylistWidget> createState() => _PlaylistWidgetState();
}

class _PlaylistWidgetState extends State<PlaylistWidget>
    with TickerProviderStateMixin {
  late PlaylistModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlaylistModel());

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
              Color(0xFF9D3636),
            ),
            valueOrDefault<Color>(
              FFAppState().currentDarkColor,
              Color(0xFF521D1D),
            ),
            Colors.black
          ],
          stops: [0.0, 0.4, 1.0],
          center: Alignment(0.0, 0.0),
          radius: 2.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 50.0,
              decoration: BoxDecoration(),
              child: Stack(
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 0.0, 0.0),
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
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      width: 150.0,
                      height: 100.0,
                      decoration: BoxDecoration(),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          'Cola de Reproducción',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Metropolis 2',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 55.0, 0.0, 0.0),
              child: Builder(
                builder: (context) {
                  final queueRealIndex = functions
                      .queueIndexGenerator(FFAppState().currentIndex,
                          FFAppState().colaIds.length)
                      .toList();

                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: queueRealIndex.length,
                    itemBuilder: (context, queueRealIndexIndex) {
                      final queueRealIndexItem =
                          queueRealIndex[queueRealIndexIndex];
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            FFAppState().currentIndex = queueRealIndexItem;
                            FFAppState().currentTitle = FFAppState()
                                .colaTitulos
                                .elementAtOrNull(queueRealIndexItem)!;
                            FFAppState().currentId = FFAppState()
                                .colaIds
                                .elementAtOrNull(queueRealIndexItem)!;
                            FFAppState().currentArtist = FFAppState()
                                .colaArtistas
                                .elementAtOrNull(queueRealIndexItem)!;
                            FFAppState().currentAlbum = FFAppState()
                                .colaAlbums
                                .elementAtOrNull(queueRealIndexItem)!;
                            safeSetState(() {});
                            _model.pickedColor = await actions.coverColorPicker(
                              FFAppState().currentId,
                              0,
                            );
                            FFAppState().currentColor =
                                (_model.pickedColor!.elementAtOrNull(0))!;
                            FFAppState().currentLightColor =
                                (_model.pickedColor!.elementAtOrNull(1))!;
                            FFAppState().currentDarkColor =
                                (_model.pickedColor!.elementAtOrNull(2))!;
                            safeSetState(() {});
                            await actions.audioController(
                              'play',
                              FFAppState()
                                  .colaRutas
                                  .elementAtOrNull(queueRealIndexItem),
                            );

                            safeSetState(() {});
                          },
                          child: Container(
                            width: 100.0,
                            height: 60.0,
                            decoration: BoxDecoration(
                              color: queueRealIndexIndex ==
                                      FFAppState().currentIndex
                                  ? Color(0x40000000)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      FFAppState()
                                          .colaTitulos
                                          .elementAtOrNull(queueRealIndexItem),
                                      'Título de canción correspondiente',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Metropolis 2',
                                          color: Colors.white,
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      FFAppState()
                                          .colaArtistas
                                          .elementAtOrNull(queueRealIndexItem),
                                      'Artista asignado',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Metropolis 2',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ].divide(SizedBox(height: 5.0)),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
  }
}
