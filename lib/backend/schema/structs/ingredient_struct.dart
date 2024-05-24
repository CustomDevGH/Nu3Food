// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IngredientStruct extends FFFirebaseStruct {
  IngredientStruct({
    String? name,
    bool? isAllergen,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _isAllergen = isAllergen,
        super(firestoreUtilData);

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "IsAllergen" field.
  bool? _isAllergen;
  bool get isAllergen => _isAllergen ?? false;
  set isAllergen(bool? val) => _isAllergen = val;
  bool hasIsAllergen() => _isAllergen != null;

  static IngredientStruct fromMap(Map<String, dynamic> data) =>
      IngredientStruct(
        name: data['Name'] as String?,
        isAllergen: data['IsAllergen'] as bool?,
      );

  static IngredientStruct? maybeFromMap(dynamic data) => data is Map
      ? IngredientStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Name': _name,
        'IsAllergen': _isAllergen,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Name': serializeParam(
          _name,
          ParamType.String,
        ),
        'IsAllergen': serializeParam(
          _isAllergen,
          ParamType.bool,
        ),
      }.withoutNulls;

  static IngredientStruct fromSerializableMap(Map<String, dynamic> data) =>
      IngredientStruct(
        name: deserializeParam(
          data['Name'],
          ParamType.String,
          false,
        ),
        isAllergen: deserializeParam(
          data['IsAllergen'],
          ParamType.bool,
          false,
        ),
      );

  static IngredientStruct fromAlgoliaData(Map<String, dynamic> data) =>
      IngredientStruct(
        name: convertAlgoliaParam(
          data['Name'],
          ParamType.String,
          false,
        ),
        isAllergen: convertAlgoliaParam(
          data['IsAllergen'],
          ParamType.bool,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'IngredientStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is IngredientStruct &&
        name == other.name &&
        isAllergen == other.isAllergen;
  }

  @override
  int get hashCode => const ListEquality().hash([name, isAllergen]);
}

IngredientStruct createIngredientStruct({
  String? name,
  bool? isAllergen,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    IngredientStruct(
      name: name,
      isAllergen: isAllergen,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

IngredientStruct? updateIngredientStruct(
  IngredientStruct? ingredient, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    ingredient
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addIngredientStructData(
  Map<String, dynamic> firestoreData,
  IngredientStruct? ingredient,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (ingredient == null) {
    return;
  }
  if (ingredient.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && ingredient.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final ingredientData = getIngredientFirestoreData(ingredient, forFieldValue);
  final nestedData = ingredientData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = ingredient.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getIngredientFirestoreData(
  IngredientStruct? ingredient, [
  bool forFieldValue = false,
]) {
  if (ingredient == null) {
    return {};
  }
  final firestoreData = mapToFirestore(ingredient.toMap());

  // Add any Firestore field values
  ingredient.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getIngredientListFirestoreData(
  List<IngredientStruct>? ingredients,
) =>
    ingredients?.map((e) => getIngredientFirestoreData(e, true)).toList() ?? [];
