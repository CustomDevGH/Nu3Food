// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NutritionStruct extends FFFirebaseStruct {
  NutritionStruct({
    String? name,
    String? units,
    double? value,
    SubNutritionStruct? subNutrition,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _units = units,
        _value = value,
        _subNutrition = subNutrition,
        super(firestoreUtilData);

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "Units" field.
  String? _units;
  String get units => _units ?? '';
  set units(String? val) => _units = val;

  bool hasUnits() => _units != null;

  // "Value" field.
  double? _value;
  double get value => _value ?? 0.0;
  set value(double? val) => _value = val;

  void incrementValue(double amount) => value = value + amount;

  bool hasValue() => _value != null;

  // "SubNutrition" field.
  SubNutritionStruct? _subNutrition;
  SubNutritionStruct get subNutrition => _subNutrition ?? SubNutritionStruct();
  set subNutrition(SubNutritionStruct? val) => _subNutrition = val;

  void updateSubNutrition(Function(SubNutritionStruct) updateFn) {
    updateFn(_subNutrition ??= SubNutritionStruct());
  }

  bool hasSubNutrition() => _subNutrition != null;

  static NutritionStruct fromMap(Map<String, dynamic> data) => NutritionStruct(
        name: data['Name'] as String?,
        units: data['Units'] as String?,
        value: castToType<double>(data['Value']),
        subNutrition: data['SubNutrition'] is SubNutritionStruct
            ? data['SubNutrition']
            : SubNutritionStruct.maybeFromMap(data['SubNutrition']),
      );

  static NutritionStruct? maybeFromMap(dynamic data) => data is Map
      ? NutritionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Name': _name,
        'Units': _units,
        'Value': _value,
        'SubNutrition': _subNutrition?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Name': serializeParam(
          _name,
          ParamType.String,
        ),
        'Units': serializeParam(
          _units,
          ParamType.String,
        ),
        'Value': serializeParam(
          _value,
          ParamType.double,
        ),
        'SubNutrition': serializeParam(
          _subNutrition,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static NutritionStruct fromSerializableMap(Map<String, dynamic> data) =>
      NutritionStruct(
        name: deserializeParam(
          data['Name'],
          ParamType.String,
          false,
        ),
        units: deserializeParam(
          data['Units'],
          ParamType.String,
          false,
        ),
        value: deserializeParam(
          data['Value'],
          ParamType.double,
          false,
        ),
        subNutrition: deserializeStructParam(
          data['SubNutrition'],
          ParamType.DataStruct,
          false,
          structBuilder: SubNutritionStruct.fromSerializableMap,
        ),
      );

  static NutritionStruct fromAlgoliaData(Map<String, dynamic> data) =>
      NutritionStruct(
        name: convertAlgoliaParam(
          data['Name'],
          ParamType.String,
          false,
        ),
        units: convertAlgoliaParam(
          data['Units'],
          ParamType.String,
          false,
        ),
        value: convertAlgoliaParam(
          data['Value'],
          ParamType.double,
          false,
        ),
        subNutrition: convertAlgoliaParam(
          data['SubNutrition'],
          ParamType.DataStruct,
          false,
          structBuilder: SubNutritionStruct.fromAlgoliaData,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'NutritionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NutritionStruct &&
        name == other.name &&
        units == other.units &&
        value == other.value &&
        subNutrition == other.subNutrition;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([name, units, value, subNutrition]);
}

NutritionStruct createNutritionStruct({
  String? name,
  String? units,
  double? value,
  SubNutritionStruct? subNutrition,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NutritionStruct(
      name: name,
      units: units,
      value: value,
      subNutrition:
          subNutrition ?? (clearUnsetFields ? SubNutritionStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NutritionStruct? updateNutritionStruct(
  NutritionStruct? nutrition, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    nutrition
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNutritionStructData(
  Map<String, dynamic> firestoreData,
  NutritionStruct? nutrition,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (nutrition == null) {
    return;
  }
  if (nutrition.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && nutrition.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final nutritionData = getNutritionFirestoreData(nutrition, forFieldValue);
  final nestedData = nutritionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = nutrition.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNutritionFirestoreData(
  NutritionStruct? nutrition, [
  bool forFieldValue = false,
]) {
  if (nutrition == null) {
    return {};
  }
  final firestoreData = mapToFirestore(nutrition.toMap());

  // Handle nested data for "SubNutrition" field.
  addSubNutritionStructData(
    firestoreData,
    nutrition.hasSubNutrition() ? nutrition.subNutrition : null,
    'SubNutrition',
    forFieldValue,
  );

  // Add any Firestore field values
  nutrition.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNutritionListFirestoreData(
  List<NutritionStruct>? nutritions,
) =>
    nutritions?.map((e) => getNutritionFirestoreData(e, true)).toList() ?? [];
