// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CancionStruct extends BaseStruct {
  CancionStruct({
    String? titulo,
    List<String>? artistas,
    String? ruta,
    int? duracion,
    int? id,
  })  : _titulo = titulo,
        _artistas = artistas,
        _ruta = ruta,
        _duracion = duracion,
        _id = id;

  // "titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  set titulo(String? val) => _titulo = val;

  bool hasTitulo() => _titulo != null;

  // "artistas" field.
  List<String>? _artistas;
  List<String> get artistas => _artistas ?? const [];
  set artistas(List<String>? val) => _artistas = val;

  void updateArtistas(Function(List<String>) updateFn) {
    updateFn(_artistas ??= []);
  }

  bool hasArtistas() => _artistas != null;

  // "ruta" field.
  String? _ruta;
  String get ruta => _ruta ?? '';
  set ruta(String? val) => _ruta = val;

  bool hasRuta() => _ruta != null;

  // "duracion" field.
  int? _duracion;
  int get duracion => _duracion ?? 0;
  set duracion(int? val) => _duracion = val;

  void incrementDuracion(int amount) => duracion = duracion + amount;

  bool hasDuracion() => _duracion != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  static CancionStruct fromMap(Map<String, dynamic> data) => CancionStruct(
        titulo: data['titulo'] as String?,
        artistas: getDataList(data['artistas']),
        ruta: data['ruta'] as String?,
        duracion: castToType<int>(data['duracion']),
        id: castToType<int>(data['id']),
      );

  static CancionStruct? maybeFromMap(dynamic data) =>
      data is Map ? CancionStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'titulo': _titulo,
        'artistas': _artistas,
        'ruta': _ruta,
        'duracion': _duracion,
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'titulo': serializeParam(
          _titulo,
          ParamType.String,
        ),
        'artistas': serializeParam(
          _artistas,
          ParamType.String,
          isList: true,
        ),
        'ruta': serializeParam(
          _ruta,
          ParamType.String,
        ),
        'duracion': serializeParam(
          _duracion,
          ParamType.int,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
      }.withoutNulls;

  static CancionStruct fromSerializableMap(Map<String, dynamic> data) =>
      CancionStruct(
        titulo: deserializeParam(
          data['titulo'],
          ParamType.String,
          false,
        ),
        artistas: deserializeParam<String>(
          data['artistas'],
          ParamType.String,
          true,
        ),
        ruta: deserializeParam(
          data['ruta'],
          ParamType.String,
          false,
        ),
        duracion: deserializeParam(
          data['duracion'],
          ParamType.int,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'CancionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CancionStruct &&
        titulo == other.titulo &&
        listEquality.equals(artistas, other.artistas) &&
        ruta == other.ruta &&
        duracion == other.duracion &&
        id == other.id;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([titulo, artistas, ruta, duracion, id]);
}

CancionStruct createCancionStruct({
  String? titulo,
  String? ruta,
  int? duracion,
  int? id,
}) =>
    CancionStruct(
      titulo: titulo,
      ruta: ruta,
      duracion: duracion,
      id: id,
    );
