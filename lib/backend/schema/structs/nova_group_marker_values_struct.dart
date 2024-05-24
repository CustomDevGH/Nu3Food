// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NovaGroupMarkerValuesStruct extends FFFirebaseStruct {
  NovaGroupMarkerValuesStruct({
    String? name,
    List<String>? values,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _values = values,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "values" field.
  List<String>? _values;
  List<String> get values => _values ?? const [];
  set values(List<String>? val) => _values = val;
  void updateValues(Function(List<String>) updateFn) =>
      updateFn(_values ??= []);
  bool hasValues() => _values != null;

  static NovaGroupMarkerValuesStruct fromMap(Map<String, dynamic> data) =>
      NovaGroupMarkerValuesStruct(
        name: data['name'] as String?,
        values: getDataList(data['values']),
      );

  static NovaGroupMarkerValuesStruct? maybeFromMap(dynamic data) => data is Map
      ? NovaGroupMarkerValuesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'values': _values,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'values': serializeParam(
          _values,
          ParamType.String,
          true,
        ),
      }.withoutNulls;

  static NovaGroupMarkerValuesStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      NovaGroupMarkerValuesStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        values: deserializeParam<String>(
          data['values'],
          ParamType.String,
          true,
        ),
      );

  static NovaGroupMarkerValuesStruct fromAlgoliaData(
          Map<String, dynamic> data) =>
      NovaGroupMarkerValuesStruct(
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        values: convertAlgoliaParam<String>(
          data['values'],
          ParamType.String,
          true,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'NovaGroupMarkerValuesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is NovaGroupMarkerValuesStruct &&
        name == other.name &&
        listEquality.equals(values, other.values);
  }

  @override
  int get hashCode => const ListEquality().hash([name, values]);
}

NovaGroupMarkerValuesStruct createNovaGroupMarkerValuesStruct({
  String? name,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NovaGroupMarkerValuesStruct(
      name: name,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NovaGroupMarkerValuesStruct? updateNovaGroupMarkerValuesStruct(
  NovaGroupMarkerValuesStruct? novaGroupMarkerValues, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    novaGroupMarkerValues
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNovaGroupMarkerValuesStructData(
  Map<String, dynamic> firestoreData,
  NovaGroupMarkerValuesStruct? novaGroupMarkerValues,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (novaGroupMarkerValues == null) {
    return;
  }
  if (novaGroupMarkerValues.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      novaGroupMarkerValues.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final novaGroupMarkerValuesData = getNovaGroupMarkerValuesFirestoreData(
      novaGroupMarkerValues, forFieldValue);
  final nestedData =
      novaGroupMarkerValuesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      novaGroupMarkerValues.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNovaGroupMarkerValuesFirestoreData(
  NovaGroupMarkerValuesStruct? novaGroupMarkerValues, [
  bool forFieldValue = false,
]) {
  if (novaGroupMarkerValues == null) {
    return {};
  }
  final firestoreData = mapToFirestore(novaGroupMarkerValues.toMap());

  // Add any Firestore field values
  novaGroupMarkerValues.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNovaGroupMarkerValuesListFirestoreData(
  List<NovaGroupMarkerValuesStruct>? novaGroupMarkerValuess,
) =>
    novaGroupMarkerValuess
        ?.map((e) => getNovaGroupMarkerValuesFirestoreData(e, true))
        .toList() ??
    [];
