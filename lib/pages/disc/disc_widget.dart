import '/backend/sqlite/sqlite_manager.dart';
import '/components/bottom_menu/bottom_menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'disc_model.dart';
export 'disc_model.dart';

class DiscWidget extends StatefulWidget {
  const DiscWidget({
    super.key,
    required this.idAlbum,
  });

  final int? idAlbum;

  static String routeName = 'Disc';
  static String routePath = '/disc';

  @override
  State<DiscWidget> createState() => _DiscWidgetState();
}

class _DiscWidgetState extends State<DiscWidget> {
  late DiscModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DiscModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.resultadoSQL = await actions.getDatosAlbum(
        widget.idAlbum!,
      );
      _model.coloresGenerados = await actions.coverColorPicker(
        getJsonField(
          _model.resultadoSQL,
          r'''$.primera_cancion_id''',
        ),
        getJsonField(
          _model.resultadoSQL,
          r'''$.color_principal''',
        ),
      );
      await Future.delayed(
        Duration(
          milliseconds: 50,
        ),
      );
      _model.listaCancionesAlbum = await actions.getCancionesAlbum(
        getJsonField(
          _model.resultadoSQL,
          r'''$.album_id''',
        ),
      );
      _model.datosAlbum = _model.resultadoSQL;
      _model.paletaAlbum = _model.coloresGenerados!.toList().cast<Color>();
      _model.listaCanciones =
          _model.listaCancionesAlbum!.toList().cast<dynamic>();
      _model.cargando = false;
      safeSetState(() {});
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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.black,
        body: SafeArea(
          top: true,
          child: Builder(
            builder: (context) {
              if (_model.cargando == false) {
                return Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 65.0,
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                          colors: [
                            valueOrDefault<Color>(
                              _model.paletaAlbum.elementAtOrNull(0),
                              Color(0xFF6C7F87),
                            ),
                            valueOrDefault<Color>(
                              _model.paletaAlbum.elementAtOrNull(1),
                              Color(0xFF253031),
                            ),
                            Colors.black
                          ],
                          stops: [0.0, 0.3, 1.0],
                          center: Alignment(0.0, -1.0),
                          radius: 15.0,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                45.0, 0.0, 0.0, 0.0),
                            child: Container(
                              width: 50.0,
                              height: 50.0,
                              child: custom_widgets.MiniSongCover(
                                width: 50.0,
                                height: 50.0,
                                cancionId: getJsonField(
                                  _model.resultadoSQL,
                                  r'''$.primera_cancion_id''',
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  getJsonField(
                                    _model.datosAlbum,
                                    r'''$.titulo_album''',
                                  ).toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Metropolis 2',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                Text(
                                  getJsonField(
                                    _model.datosAlbum,
                                    r'''$.nombre_artista''',
                                  ).toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Metropolis 2',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.safePop();
                            },
                            child: Icon(
                              Icons.arrow_back_ios_rounded,
                              color: Colors.white,
                              size: 24.0,
                            ),
                          ),
                          Icon(
                            Icons.more_vert_sharp,
                            color: Colors.white,
                            size: 24.0,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 65.0, 0.0, 0.0),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 343.0,
                                      child: custom_widgets.BigSongCover(
                                        width: double.infinity,
                                        height: 343.0,
                                        cancionId: getJsonField(
                                          _model.resultadoSQL,
                                          r'''$.primera_cancion_id''',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 25.0, 20.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 61.0,
                                        height: 61.0,
                                        decoration: BoxDecoration(
                                          gradient: RadialGradient(
                                            colors: [
                                              Color(0xFF6C7F87),
                                              Color(0xFF253031),
                                              Colors.black
                                            ],
                                            stops: [0.0, 0.3, 1.0],
                                            center: Alignment(1.0, 1.0),
                                            radius: 6.0,
                                          ),
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Color(0x40888888),
                                          ),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            Icons.person,
                                            color: Colors.white,
                                            size: 30.0,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  getJsonField(
                                                    _model.datosAlbum,
                                                    r'''$.titulo_album''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Metropolis 2',
                                                        color: Colors.white,
                                                        fontSize: 25.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      getJsonField(
                                                        _model.datosAlbum,
                                                        r'''$.nombre_artista''',
                                                      ).toString(),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Metropolis 2',
                                                            color: Colors.white,
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 0.0),
                                                  child: Text(
                                                    getJsonField(
                                                      _model.datosAlbum,
                                                      r'''$.fecha_lanzamiento''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Metropolis 2',
                                                          color: Colors.white,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              FFAppState().colaIds = (_model
                                                      .listaCanciones
                                                      .map((e) => getJsonField(
                                                            e,
                                                            r'''$.id''',
                                                          ))
                                                      .toList())
                                                  .cast<int>()
                                                  .toList()
                                                  .cast<int>();
                                              FFAppState().colaTitulos =
                                                  _model.listaCanciones
                                                      .map((e) => getJsonField(
                                                            e,
                                                            r'''$.titulo''',
                                                          ))
                                                      .toList()
                                                      .map((e) => e.toString())
                                                      .toList()
                                                      .cast<String>();
                                              FFAppState().colaArtistas =
                                                  _model.listaCanciones
                                                      .map((e) => getJsonField(
                                                            e,
                                                            r'''$.artista''',
                                                          ))
                                                      .toList()
                                                      .map((e) => e.toString())
                                                      .toList()
                                                      .cast<String>();
                                              FFAppState().colaRutas =
                                                  _model.listaCanciones
                                                      .map((e) => getJsonField(
                                                            e,
                                                            r'''$.ruta''',
                                                          ))
                                                      .toList()
                                                      .map((e) => e.toString())
                                                      .toList()
                                                      .cast<String>();
                                              FFAppState().colaColores = (_model
                                                      .listaCanciones
                                                      .map((e) => getJsonField(
                                                            e,
                                                            r'''$.color''',
                                                          ))
                                                      .toList())
                                                  .cast<int>()
                                                  .toList()
                                                  .cast<int>();
                                              FFAppState().colaAlbums =
                                                  _model.listaCanciones
                                                      .map((e) => getJsonField(
                                                            e,
                                                            r'''$.album''',
                                                          ))
                                                      .toList()
                                                      .map((e) => e.toString())
                                                      .toList()
                                                      .cast<String>();
                                              FFAppState().currentIndex = 0;
                                              FFAppState().isPlaying = true;
                                              FFAppState().currentId =
                                                  getJsonField(
                                                _model.listaCanciones
                                                    .elementAtOrNull(0),
                                                r'''$.id''',
                                              );
                                              FFAppState().currentTitle =
                                                  getJsonField(
                                                _model.listaCanciones
                                                    .elementAtOrNull(0),
                                                r'''$.titulo''',
                                              ).toString();
                                              FFAppState().currentArtist =
                                                  getJsonField(
                                                _model.listaCanciones
                                                    .elementAtOrNull(0),
                                                r'''$.artista''',
                                              ).toString();
                                              FFAppState().currentAlbum =
                                                  getJsonField(
                                                _model.listaCanciones
                                                    .elementAtOrNull(0),
                                                r'''$.album''',
                                              ).toString();
                                              FFAppState().loopMode = 1;
                                              safeSetState(() {});
                                              await actions.audioController(
                                                'play',
                                                getJsonField(
                                                  _model.listaCanciones
                                                      .elementAtOrNull(0),
                                                  r'''$.ruta''',
                                                ).toString(),
                                              );
                                              _model.colorElegido =
                                                  await actions
                                                      .coverColorPicker(
                                                FFAppState()
                                                    .colaIds
                                                    .elementAtOrNull(
                                                        FFAppState()
                                                            .currentIndex)!,
                                                FFAppState()
                                                    .colaColores
                                                    .elementAtOrNull(
                                                        FFAppState()
                                                            .currentIndex),
                                              );
                                              FFAppState().currentColor =
                                                  (_model.colorElegido!
                                                      .elementAtOrNull(0))!;
                                              FFAppState().currentDarkColor =
                                                  (_model.colorElegido!
                                                      .elementAtOrNull(1))!;
                                              safeSetState(() {});
                                              if (FFAppState()
                                                      .colaColores
                                                      .elementAtOrNull(0) ==
                                                  0) {
                                                await SQLiteManager.instance
                                                    .updateColor(
                                                  color: functions.colorToInt(
                                                      (_model.colorElegido!
                                                          .elementAtOrNull(
                                                              0))!),
                                                  id: FFAppState()
                                                      .colaIds
                                                      .elementAtOrNull(0)!,
                                                );
                                                FFAppState()
                                                    .updateColaColoresAtIndex(
                                                  FFAppState().currentIndex,
                                                  (_) => functions.colorToInt(
                                                      (_model.colorElegido!
                                                          .elementAtOrNull(
                                                              0))!),
                                                );
                                                safeSetState(() {});
                                              }

                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                gradient: RadialGradient(
                                                  colors: [
                                                    valueOrDefault<Color>(
                                                      _model.paletaAlbum
                                                          .elementAtOrNull(0),
                                                      Color(0xFF6C7F87),
                                                    ),
                                                    valueOrDefault<Color>(
                                                      _model.paletaAlbum
                                                          .elementAtOrNull(1),
                                                      Color(0xFF253031),
                                                    ),
                                                    Colors.black
                                                  ],
                                                  stops: [0.0, 0.3, 1.0],
                                                  center: Alignment(1.0, 1.0),
                                                  radius: 25.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                                shape: BoxShape.rectangle,
                                                border: Border.all(
                                                  color: Color(0x40888888),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  2.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'REPRODUCIR',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Metropolis 2',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Icon(
                                                        Icons
                                                            .play_arrow_rounded,
                                                        color: Colors.white,
                                                        size: 40.0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                        child: Container(
                                          width: 50.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            gradient: RadialGradient(
                                              colors: [
                                                valueOrDefault<Color>(
                                                  _model.paletaAlbum
                                                      .elementAtOrNull(0),
                                                  Color(0xFF6C7F87),
                                                ),
                                                valueOrDefault<Color>(
                                                  _model.paletaAlbum
                                                      .elementAtOrNull(1),
                                                  Color(0xFF253031),
                                                ),
                                                Colors.black
                                              ],
                                              stops: [0.0, 0.3, 1.0],
                                              center: Alignment(1.0, 1.0),
                                              radius: 25.0,
                                            ),
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Color(0x40888888),
                                            ),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.random,
                                              color: Colors.white,
                                              size: 25.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 10.0)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 15.0, 20.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                        child: Text(
                                          'Canciones',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Metropolis 2',
                                                color: Colors.white,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                        child: Text(
                                          'Duración: ${functions.formatearDuracion(getJsonField(
                                            _model.datosAlbum,
                                            r'''$.duracion_total''',
                                          ))}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Metropolis 2',
                                                color: Colors.white,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 15.0, 20.0, 180.0),
                                  child: Builder(
                                    builder: (context) {
                                      final cancionAlbum =
                                          _model.listaCanciones.toList();

                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: cancionAlbum.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 20.0),
                                        itemBuilder:
                                            (context, cancionAlbumIndex) {
                                          final cancionAlbumItem =
                                              cancionAlbum[cancionAlbumIndex];
                                          return Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Stack(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                getJsonField(
                                                                          cancionAlbumItem,
                                                                          r'''$.numero_track''',
                                                                        ) !=
                                                                        null
                                                                    ? getJsonField(
                                                                        cancionAlbumItem,
                                                                        r'''$.numero_track''',
                                                                      ).toString()
                                                                    : '-',
                                                                '-',
                                                              ),
                                                              textAlign:
                                                                  TextAlign.end,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Metropolis 2',
                                                                    color: Colors
                                                                        .white,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    getJsonField(
                                                                      cancionAlbumItem,
                                                                      r'''$.titulo''',
                                                                    ).toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Metropolis 2',
                                                                          color:
                                                                              Colors.white,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    functions
                                                                        .formatearDuracion(
                                                                            getJsonField(
                                                                      cancionAlbumItem,
                                                                      r'''$.duracion''',
                                                                    )),
                                                                    'tiempo',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Metropolis 2',
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            0.0,
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
                                              ],
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
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 20.0),
                              child: wrapWithModel(
                                model: _model.bottomMenuModel,
                                updateCallback: () => safeSetState(() {}),
                                child: BottomMenuWidget(
                                  page: 'discs',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          'Cargando...',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Metropolis 2',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
