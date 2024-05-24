// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubNutritionStruct extends FFFirebaseStruct {
  SubNutritionStruct({
    String? name,
    double? value,
    String? unit,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _value = value,
        _unit = unit,
        super(firestoreUtilData);

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "Value" field.
  double? _value;
  double get value => _value ?? 0.0;
  set value(double? val) => _value = val;
  void incrementValue(double amount) => _value = value + amount;
  bool hasValue() => _value != null;

  // "Unit" field.
  String? _unit;
  String get unit => _unit ?? '';
  set unit(String? val) => _unit = val;
  bool hasUnit() => _unit != null;

  static SubNutritionStruct fromMap(Map<String, dynamic> data) =>
      SubNutritionStruct(
        name: data['Name'] as String?,
        value: castToType<double>(data['Value']),
        unit: data['Unit'] as String?,
      );

  static SubNutritionStruct? maybeFromMap(dynamic data) => data is Map
      ? SubNutritionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Name': _name,
        'Value': _value,
        'Unit': _unit,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Name': serializeParam(
          _name,
          ParamType.String,
        ),
        'Value': serializeParam(
          _value,
          ParamType.double,
        ),
        'Unit': serializeParam(
          _unit,
          ParamType.String,
        ),
      }.withoutNulls;

  static SubNutritionStruct fromSerializableMap(Map<String, dynamic> data) =>
      SubNutritionStruct(
        name: deserializeParam(
          data['Name'],
          ParamType.String,
          false,
        ),
        value: deserializeParam(
          data['Value'],
          ParamType.double,
          false,
        ),
        unit: deserializeParam(
          data['Unit'],
          ParamType.String,
          false,
        ),
      );

  static SubNutritionStruct fromAlgoliaData(Map<String, dynamic> data) =>
      SubNutritionStruct(
        name: convertAlgoliaParam(
          data['Name'],
          ParamType.String,
          false,
        ),
        value: convertAlgoliaParam(
          data['Value'],
          ParamType.double,
          false,
        ),
        unit: convertAlgoliaParam(
          data['Unit'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'SubNutritionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SubNutritionStruct &&
        name == other.name &&
        value == other.value &&
        unit == other.unit;
  }

  @override
  int get hashCode => const ListEquality().hash([name, value, unit]);
}

SubNutritionStruct createSubNutritionStruct({
  String? name,
  double? value,
  String? unit,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SubNutritionStruct(
      name: name,
      value: value,
      unit: unit,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SubNutritionStruct? updateSubNutritionStruct(
  SubNutritionStruct? subNutrition, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    subNutrition
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSubNutritionStructData(
  Map<String, dynamic> firestoreData,
  SubNutritionStruct? subNutrition,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (subNutrition == null) {
    return;
  }
  if (subNutrition.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && subNutrition.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final subNutritionData =
      getSubNutritionFirestoreData(subNutrition, forFieldValue);
  final nestedData =
      subNutritionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = subNutrition.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSubNutritionFirestoreData(
  SubNutritionStruct? subNutrition, [
  bool forFieldValue = false,
]) {
  if (subNutrition == null) {
    return {};
  }
  final firestoreData = mapToFirestore(subNutrition.toMap());

  // Add any Firestore field values
  subNutrition.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSubNutritionListFirestoreData(
  List<SubNutritionStruct>? subNutritions,
) =>
    subNutritions?.map((e) => getSubNutritionFirestoreData(e, true)).toList() ??
    [];
