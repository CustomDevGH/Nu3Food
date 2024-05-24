// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MedicationStructStruct extends FFFirebaseStruct {
  MedicationStructStruct({
    String? name,
    bool? isSafe,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _isSafe = isSafe,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "isSafe" field.
  bool? _isSafe;
  bool get isSafe => _isSafe ?? false;
  set isSafe(bool? val) => _isSafe = val;
  bool hasIsSafe() => _isSafe != null;

  static MedicationStructStruct fromMap(Map<String, dynamic> data) =>
      MedicationStructStruct(
        name: data['name'] as String?,
        isSafe: data['isSafe'] as bool?,
      );

  static MedicationStructStruct? maybeFromMap(dynamic data) => data is Map
      ? MedicationStructStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'isSafe': _isSafe,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'isSafe': serializeParam(
          _isSafe,
          ParamType.bool,
        ),
      }.withoutNulls;

  static MedicationStructStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      MedicationStructStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        isSafe: deserializeParam(
          data['isSafe'],
          ParamType.bool,
          false,
        ),
      );

  static MedicationStructStruct fromAlgoliaData(Map<String, dynamic> data) =>
      MedicationStructStruct(
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        isSafe: convertAlgoliaParam(
          data['isSafe'],
          ParamType.bool,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'MedicationStructStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MedicationStructStruct &&
        name == other.name &&
        isSafe == other.isSafe;
  }

  @override
  int get hashCode => const ListEquality().hash([name, isSafe]);
}

MedicationStructStruct createMedicationStructStruct({
  String? name,
  bool? isSafe,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MedicationStructStruct(
      name: name,
      isSafe: isSafe,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MedicationStructStruct? updateMedicationStructStruct(
  MedicationStructStruct? medicationStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    medicationStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMedicationStructStructData(
  Map<String, dynamic> firestoreData,
  MedicationStructStruct? medicationStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (medicationStruct == null) {
    return;
  }
  if (medicationStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && medicationStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final medicationStructData =
      getMedicationStructFirestoreData(medicationStruct, forFieldValue);
  final nestedData =
      medicationStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = medicationStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMedicationStructFirestoreData(
  MedicationStructStruct? medicationStruct, [
  bool forFieldValue = false,
]) {
  if (medicationStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(medicationStruct.toMap());

  // Add any Firestore field values
  medicationStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMedicationStructListFirestoreData(
  List<MedicationStructStruct>? medicationStructs,
) =>
    medicationStructs
        ?.map((e) => getMedicationStructFirestoreData(e, true))
        .toList() ??
    [];
