// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NutrientStruct extends FFFirebaseStruct {
  NutrientStruct({
    String? nutrientType,
    String? unit,
    String? value,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nutrientType = nutrientType,
        _unit = unit,
        _value = value,
        super(firestoreUtilData);

  // "NutrientType" field.
  String? _nutrientType;
  String get nutrientType => _nutrientType ?? '';
  set nutrientType(String? val) => _nutrientType = val;

  bool hasNutrientType() => _nutrientType != null;

  // "Unit" field.
  String? _unit;
  String get unit => _unit ?? '';
  set unit(String? val) => _unit = val;

  bool hasUnit() => _unit != null;

  // "Value" field.
  String? _value;
  String get value => _value ?? '';
  set value(String? val) => _value = val;

  bool hasValue() => _value != null;

  static NutrientStruct fromMap(Map<String, dynamic> data) => NutrientStruct(
        nutrientType: data['NutrientType'] as String?,
        unit: data['Unit'] as String?,
        value: data['Value'] as String?,
      );

  static NutrientStruct? maybeFromMap(dynamic data) =>
      data is Map ? NutrientStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'NutrientType': _nutrientType,
        'Unit': _unit,
        'Value': _value,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'NutrientType': serializeParam(
          _nutrientType,
          ParamType.String,
        ),
        'Unit': serializeParam(
          _unit,
          ParamType.String,
        ),
        'Value': serializeParam(
          _value,
          ParamType.String,
        ),
      }.withoutNulls;

  static NutrientStruct fromSerializableMap(Map<String, dynamic> data) =>
      NutrientStruct(
        nutrientType: deserializeParam(
          data['NutrientType'],
          ParamType.String,
          false,
        ),
        unit: deserializeParam(
          data['Unit'],
          ParamType.String,
          false,
        ),
        value: deserializeParam(
          data['Value'],
          ParamType.String,
          false,
        ),
      );

  static NutrientStruct fromAlgoliaData(Map<String, dynamic> data) =>
      NutrientStruct(
        nutrientType: convertAlgoliaParam(
          data['NutrientType'],
          ParamType.String,
          false,
        ),
        unit: convertAlgoliaParam(
          data['Unit'],
          ParamType.String,
          false,
        ),
        value: convertAlgoliaParam(
          data['Value'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'NutrientStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NutrientStruct &&
        nutrientType == other.nutrientType &&
        unit == other.unit &&
        value == other.value;
  }

  @override
  int get hashCode => const ListEquality().hash([nutrientType, unit, value]);
}

NutrientStruct createNutrientStruct({
  String? nutrientType,
  String? unit,
  String? value,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NutrientStruct(
      nutrientType: nutrientType,
      unit: unit,
      value: value,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NutrientStruct? updateNutrientStruct(
  NutrientStruct? nutrient, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    nutrient
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNutrientStructData(
  Map<String, dynamic> firestoreData,
  NutrientStruct? nutrient,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (nutrient == null) {
    return;
  }
  if (nutrient.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && nutrient.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final nutrientData = getNutrientFirestoreData(nutrient, forFieldValue);
  final nestedData = nutrientData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = nutrient.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNutrientFirestoreData(
  NutrientStruct? nutrient, [
  bool forFieldValue = false,
]) {
  if (nutrient == null) {
    return {};
  }
  final firestoreData = mapToFirestore(nutrient.toMap());

  // Add any Firestore field values
  nutrient.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNutrientListFirestoreData(
  List<NutrientStruct>? nutrients,
) =>
    nutrients?.map((e) => getNutrientFirestoreData(e, true)).toList() ?? [];
