import '/backend/sqlite/sqlite_manager.dart';
import '/components/bottom_menu/bottom_menu_widget.dart';
import '/components/top_menu/top_menu_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
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
    context.watch<FFAppState>();

    return FutureBuilder<List<ListSongsRow>>(
      future: SQLiteManager.instance.listSongs(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFF161616),
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
            backgroundColor: Color(0xFF161616),
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
                          EdgeInsetsDirectional.fromSTEB(0.0, 55.0, 0.0, 0.0),
                      child: ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context).copyWith(
                          scrollbars: false,
                          dragDevices: {
                            PointerDeviceKind.mouse,
                            PointerDeviceKind.touch,
                            PointerDeviceKind.stylus,
                            PointerDeviceKind.unknown,
                          },
                        ),
                        child: Scrollbar(
                          controller: _model.columnController,
                          child: SingleChildScrollView(
                            controller: _model.columnController,
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
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 0.0),
                                                child:
                                                    FlutterFlowDropDown<String>(
                                                  controller: _model
                                                          .dropDownValueController ??=
                                                      FormFieldController<
                                                          String>(
                                                    _model.dropDownValue ??=
                                                        'Alfabéticamente',
                                                  ),
                                                  options: [
                                                    'Alfabéticamente',
                                                    'Alfabéticamente (invertido)',
                                                    'Más nuevas primero',
                                                    'Más antiguas primero',
                                                    'Por artista',
                                                    'Por compositor',
                                                    'Por álbum'
                                                  ],
                                                  onChanged: (val) =>
                                                      safeSetState(() => _model
                                                          .dropDownValue = val),
                                                  width: double.infinity,
                                                  height: 40.0,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
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
                                                        color:
                                                            Color(0xFF969696),
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
                                                  hintText: 'Ordenar...',
                                                  icon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 24.0,
                                                  ),
                                                  fillColor: Color(0xFF232323),
                                                  elevation: 2.0,
                                                  borderColor:
                                                      Color(0xFF555555),
                                                  borderWidth: 0.0,
                                                  borderRadius: 8.0,
                                                  margin: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  hidesUnderline: true,
                                                  isOverButton: false,
                                                  isSearchable: false,
                                                  isMultiSelect: false,
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final listSongs =
                                                            songsListSongsRowList
                                                                .toList();

                                                        return ListView
                                                            .separated(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              listSongs.length,
                                                          separatorBuilder: (_,
                                                                  __) =>
                                                              SizedBox(
                                                                  height: 5.0),
                                                          itemBuilder: (context,
                                                              listSongsIndex) {
                                                            final listSongsItem =
                                                                listSongs[
                                                                    listSongsIndex];
                                                            return InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                FFAppState()
                                                                        .currentTitle =
                                                                    listSongsItem
                                                                        .titulo;
                                                                FFAppState()
                                                                        .currentId =
                                                                    listSongsItem
                                                                        .id;
                                                                FFAppState()
                                                                        .currentArtist =
                                                                    listSongsItem
                                                                        .artista;
                                                                FFAppState()
                                                                        .isPlaying =
                                                                    true;
                                                                FFAppState()
                                                                        .currentAlbum =
                                                                    listSongsItem
                                                                        .album;
                                                                FFAppState()
                                                                        .colaIds =
                                                                    songsListSongsRowList
                                                                        .map((e) => e
                                                                            .id)
                                                                        .toList()
                                                                        .cast<
                                                                            int>();
                                                                FFAppState()
                                                                        .colaTitulos =
                                                                    songsListSongsRowList
                                                                        .map((e) => e
                                                                            .titulo)
                                                                        .toList()
                                                                        .cast<
                                                                            String>();
                                                                FFAppState()
                                                                        .colaArtistas =
                                                                    songsListSongsRowList
                                                                        .map((e) => e
                                                                            .artista)
                                                                        .toList()
                                                                        .cast<
                                                                            String>();
                                                                FFAppState()
                                                                        .colaRutas =
                                                                    songsListSongsRowList
                                                                        .map((e) => e
                                                                            .ruta)
                                                                        .toList()
                                                                        .cast<
                                                                            String>();
                                                                FFAppState()
                                                                        .currentIndex =
                                                                    listSongsIndex;
                                                                FFAppState()
                                                                        .colaAlbums =
                                                                    songsListSongsRowList
                                                                        .map((e) => e
                                                                            .album)
                                                                        .toList()
                                                                        .cast<
                                                                            String>();
                                                                FFAppState()
                                                                        .colaColores =
                                                                    songsListSongsRowList
                                                                        .map((e) => e
                                                                            .color)
                                                                        .toList()
                                                                        .cast<
                                                                            int>();
                                                                safeSetState(
                                                                    () {});
                                                                await actions
                                                                    .audioController(
                                                                  'play',
                                                                  listSongsItem
                                                                      .ruta,
                                                                );
                                                                _model.pickedColor =
                                                                    await actions
                                                                        .coverColorPicker(
                                                                  listSongsItem
                                                                      .id,
                                                                  listSongsItem
                                                                      .color,
                                                                );
                                                                FFAppState()
                                                                        .currentColor =
                                                                    (_model
                                                                        .pickedColor!
                                                                        .elementAtOrNull(
                                                                            0))!;
                                                                FFAppState()
                                                                        .currentLightColor =
                                                                    (_model
                                                                        .pickedColor!
                                                                        .elementAtOrNull(
                                                                            1))!;
                                                                FFAppState()
                                                                        .currentDarkColor =
                                                                    (_model
                                                                        .pickedColor!
                                                                        .elementAtOrNull(
                                                                            2))!;
                                                                FFAppState()
                                                                        .currentTextColor =
                                                                    (_model
                                                                        .pickedColor!
                                                                        .elementAtOrNull(
                                                                            3))!;
                                                                safeSetState(
                                                                    () {});
                                                                if (listSongsItem
                                                                        .color ==
                                                                    0) {
                                                                  await SQLiteManager
                                                                      .instance
                                                                      .updateColor(
                                                                    color: functions.colorToInt((_model
                                                                        .pickedColor!
                                                                        .elementAtOrNull(
                                                                            0))!),
                                                                    id: listSongsItem
                                                                        .id,
                                                                  );
                                                                }

                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              child: Container(
                                                                width: 100.0,
                                                                height: 50.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFF161616),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0.0),
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            40.0,
                                                                        height:
                                                                            40.0,
                                                                        child: custom_widgets
                                                                            .MiniSongCover(
                                                                          width:
                                                                              40.0,
                                                                          height:
                                                                              40.0,
                                                                          cancionId:
                                                                              listSongsItem.id,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            listSongsItem.titulo,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: Colors.white,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                Text(
                                                                              listSongsItem.artista,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: Colors.white,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                      } else {
                                        return Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'Sincronizando biblioteca...',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
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
                                                          color: Colors.white,
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
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 10.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.fullyRandomizedPlaylist =
                                    await SQLiteManager.instance
                                        .getRandomSong();
                                FFAppState().colaIds = _model
                                    .fullyRandomizedPlaylist!
                                    .map((e) => e.id)
                                    .toList()
                                    .cast<int>();
                                FFAppState().colaTitulos = _model
                                    .fullyRandomizedPlaylist!
                                    .map((e) => e.titulo)
                                    .toList()
                                    .cast<String>();
                                FFAppState().colaArtistas = _model
                                    .fullyRandomizedPlaylist!
                                    .map((e) => e.nombreArtista)
                                    .toList()
                                    .cast<String>();
                                FFAppState().colaRutas = _model
                                    .fullyRandomizedPlaylist!
                                    .map((e) => e.rutaArchivo)
                                    .toList()
                                    .cast<String>();
                                FFAppState().colaColores = _model
                                    .fullyRandomizedPlaylist!
                                    .map((e) => e.color)
                                    .toList()
                                    .cast<int>();
                                FFAppState().colaAlbums = _model
                                    .fullyRandomizedPlaylist!
                                    .map((e) => e.nombreAlbum)
                                    .toList()
                                    .cast<String>();
                                FFAppState().currentIndex = 0;
                                FFAppState().isPlaying = true;
                                FFAppState().currentTitle = _model
                                    .fullyRandomizedPlaylist!
                                    .elementAtOrNull(0)!
                                    .titulo;
                                FFAppState().currentId = _model
                                    .fullyRandomizedPlaylist!
                                    .elementAtOrNull(0)!
                                    .id;
                                FFAppState().currentArtist = _model
                                    .fullyRandomizedPlaylist!
                                    .elementAtOrNull(0)!
                                    .nombreArtista;
                                FFAppState().currentAlbum = _model
                                    .fullyRandomizedPlaylist!
                                    .elementAtOrNull(0)!
                                    .nombreAlbum;
                                safeSetState(() {});
                                await Future.delayed(
                                  Duration(
                                    milliseconds: 125,
                                  ),
                                );
                                await actions.audioController(
                                  'play',
                                  FFAppState().colaRutas.elementAtOrNull(
                                      FFAppState().currentIndex),
                                );
                                _model.fullyRandomizedPickedColor =
                                    await actions.coverColorPicker(
                                  FFAppState().colaIds.elementAtOrNull(
                                      FFAppState().currentIndex)!,
                                  FFAppState().colaColores.elementAtOrNull(
                                      FFAppState().currentIndex),
                                );
                                FFAppState().currentColor = (_model
                                    .fullyRandomizedPickedColor!
                                    .elementAtOrNull(0))!;
                                safeSetState(() {});
                                if (FFAppState()
                                        .colaColores
                                        .elementAtOrNull(0) ==
                                    0) {
                                  await SQLiteManager.instance.updateColor(
                                    color: functions.colorToInt((_model
                                        .fullyRandomizedPickedColor!
                                        .elementAtOrNull(0))!),
                                    id: FFAppState()
                                        .colaIds
                                        .elementAtOrNull(0)!,
                                  );
                                  FFAppState().updateColaColoresAtIndex(
                                    FFAppState().currentIndex,
                                    (_) => functions.colorToInt((_model
                                        .fullyRandomizedPickedColor!
                                        .elementAtOrNull(0))!),
                                  );
                                  safeSetState(() {});
                                }

                                safeSetState(() {});
                              },
                              child: Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  shape: BoxShape.circle,
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.random,
                                    color: Colors.black,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 20.0),
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
