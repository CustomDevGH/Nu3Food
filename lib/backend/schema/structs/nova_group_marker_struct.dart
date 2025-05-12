// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NovaGroupMarkerStruct extends FFFirebaseStruct {
  NovaGroupMarkerStruct({
    int? id,
    List<NovaGroupMarkerValuesStruct>? values,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _values = values,
        super(firestoreUtilData);

  // "Id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "Values" field.
  List<NovaGroupMarkerValuesStruct>? _values;
  List<NovaGroupMarkerValuesStruct> get values => _values ?? const [];
  set values(List<NovaGroupMarkerValuesStruct>? val) => _values = val;

  void updateValues(Function(List<NovaGroupMarkerValuesStruct>) updateFn) {
    updateFn(_values ??= []);
  }

  bool hasValues() => _values != null;

  static NovaGroupMarkerStruct fromMap(Map<String, dynamic> data) =>
      NovaGroupMarkerStruct(
        id: castToType<int>(data['Id']),
        values: getStructList(
          data['Values'],
          NovaGroupMarkerValuesStruct.fromMap,
        ),
      );

  static NovaGroupMarkerStruct? maybeFromMap(dynamic data) => data is Map
      ? NovaGroupMarkerStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Id': _id,
        'Values': _values?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Id': serializeParam(
          _id,
          ParamType.int,
        ),
        'Values': serializeParam(
          _values,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static NovaGroupMarkerStruct fromSerializableMap(Map<String, dynamic> data) =>
      NovaGroupMarkerStruct(
        id: deserializeParam(
          data['Id'],
          ParamType.int,
          false,
        ),
        values: deserializeStructParam<NovaGroupMarkerValuesStruct>(
          data['Values'],
          ParamType.DataStruct,
          true,
          structBuilder: NovaGroupMarkerValuesStruct.fromSerializableMap,
        ),
      );

  static NovaGroupMarkerStruct fromAlgoliaData(Map<String, dynamic> data) =>
      NovaGroupMarkerStruct(
        id: convertAlgoliaParam(
          data['Id'],
          ParamType.int,
          false,
        ),
        values: convertAlgoliaParam<NovaGroupMarkerValuesStruct>(
          data['Values'],
          ParamType.DataStruct,
          true,
          structBuilder: NovaGroupMarkerValuesStruct.fromAlgoliaData,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'NovaGroupMarkerStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is NovaGroupMarkerStruct &&
        id == other.id &&
        listEquality.equals(values, other.values);
  }

  @override
  int get hashCode => const ListEquality().hash([id, values]);
}

NovaGroupMarkerStruct createNovaGroupMarkerStruct({
  int? id,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NovaGroupMarkerStruct(
      id: id,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NovaGroupMarkerStruct? updateNovaGroupMarkerStruct(
  NovaGroupMarkerStruct? novaGroupMarker, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    novaGroupMarker
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNovaGroupMarkerStructData(
  Map<String, dynamic> firestoreData,
  NovaGroupMarkerStruct? novaGroupMarker,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (novaGroupMarker == null) {
    return;
  }
  if (novaGroupMarker.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && novaGroupMarker.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final novaGroupMarkerData =
      getNovaGroupMarkerFirestoreData(novaGroupMarker, forFieldValue);
  final nestedData =
      novaGroupMarkerData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = novaGroupMarker.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNovaGroupMarkerFirestoreData(
  NovaGroupMarkerStruct? novaGroupMarker, [
  bool forFieldValue = false,
]) {
  if (novaGroupMarker == null) {
    return {};
  }
  final firestoreData = mapToFirestore(novaGroupMarker.toMap());

  // Add any Firestore field values
  novaGroupMarker.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNovaGroupMarkerListFirestoreData(
  List<NovaGroupMarkerStruct>? novaGroupMarkers,
) =>
    novaGroupMarkers
        ?.map((e) => getNovaGroupMarkerFirestoreData(e, true))
        .toList() ??
    [];
