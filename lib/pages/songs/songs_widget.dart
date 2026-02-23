import '/backend/sqlite/sqlite_manager.dart';
import '/components/bottom_menu/bottom_menu_widget.dart';
import '/components/top_menu/top_menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'songs_model.dart';
export 'songs_model.dart';

class SongsWidget extends StatefulWidget {
  const SongsWidget({super.key});

  static String routeName = 'Songs';
  static String routePath = '/songs';

  @override
  State<SongsWidget> createState() => _SongsWidgetState();
}

class _SongsWidgetState extends State<SongsWidget> {
  late SongsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SongsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.librarySync();
      _model.estaCargando = false;
      safeSetState(() {});
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Sincronización terminada',
            style: TextStyle(
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
          duration: Duration(milliseconds: 4000),
          backgroundColor: FlutterFlowTheme.of(context).secondary,
        ),
      );
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ListSongsRow>>(
      future: SQLiteManager.instance.listSongs(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final songsListSongsRowList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  wrapWithModel(
                    model: _model.topMenuModel,
                    updateCallback: () => safeSetState(() {}),
                    child: TopMenuWidget(),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: Builder(
                                builder: (context) {
                                  if (_model.estaCargando == false) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Builder(
                                          builder: (context) {
                                            final listSongs =
                                                songsListSongsRowList.toList();

                                            return ListView.separated(
                                              padding: EdgeInsets.zero,
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: listSongs.length,
                                              separatorBuilder: (_, __) =>
                                                  SizedBox(height: 5.0),
                                              itemBuilder:
                                                  (context, listSongsIndex) {
                                                final listSongsItem =
                                                    listSongs[listSongsIndex];
                                                return InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    FFAppState().currentTitle =
                                                        listSongsItem.titulo;
                                                    FFAppState().currentId =
                                                        listSongsItem.id;
                                                    FFAppState().currentArtist =
                                                        listSongsItem.artista;
                                                    FFAppState().isPlaying =
                                                        true;
                                                    FFAppState().currentAlbum =
                                                        listSongsItem.album;
                                                    FFAppState().colaIds =
                                                        songsListSongsRowList
                                                            .map((e) => e.id)
                                                            .toList()
                                                            .cast<int>();
                                                    FFAppState().colaTitulos =
                                                        songsListSongsRowList
                                                            .map(
                                                                (e) => e.titulo)
                                                            .toList()
                                                            .cast<String>();
                                                    FFAppState().colaArtistas =
                                                        songsListSongsRowList
                                                            .map((e) =>
                                                                e.artista)
                                                            .toList()
                                                            .cast<String>();
                                                    FFAppState().colaRutas =
                                                        songsListSongsRowList
                                                            .map((e) => e.ruta)
                                                            .toList()
                                                            .cast<String>();
                                                    FFAppState().currentIndex =
                                                        listSongsIndex;
                                                    FFAppState().currentAlbums =
                                                        songsListSongsRowList
                                                            .map((e) => e.album)
                                                            .toList()
                                                            .cast<String>();
                                                    await actions
                                                        .audioController(
                                                      'play',
                                                      listSongsItem.ruta,
                                                    );
                                                    _model.pickedColor =
                                                        await actions
                                                            .coverColorPicker(
                                                      listSongsItem.id,
                                                    );
                                                    FFAppState().currentColor =
                                                        (_model.pickedColor!
                                                            .elementAtOrNull(
                                                                0))!;
                                                    FFAppState()
                                                            .currentLightColor =
                                                        (_model.pickedColor!
                                                            .elementAtOrNull(
                                                                1))!;
                                                    FFAppState()
                                                            .currentDarkColor =
                                                        (_model.pickedColor!
                                                            .elementAtOrNull(
                                                                2))!;
                                                    FFAppState()
                                                            .currentTextColor =
                                                        (_model.pickedColor!
                                                            .elementAtOrNull(
                                                                3))!;

                                                    safeSetState(() {});
                                                  },
                                                  child: Container(
                                                    width: 100.0,
                                                    height: 50.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: 40.0,
                                                            height: 40.0,
                                                            child: custom_widgets
                                                                .MiniSongCover(
                                                              width: 40.0,
                                                              height: 40.0,
                                                              cancionId:
                                                                  listSongsItem
                                                                      .id,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                listSongsItem
                                                                    .titulo,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child: Text(
                                                                  listSongsItem
                                                                      .artista,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    );
                                  } else {
                                    return Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Sincronizando biblioteca...',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
                      child: wrapWithModel(
                        model: _model.bottomMenuModel,
                        updateCallback: () => safeSetState(() {}),
                        child: BottomMenuWidget(
                          page: 'songs',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
