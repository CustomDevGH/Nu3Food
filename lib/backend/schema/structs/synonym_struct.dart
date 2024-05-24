// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SynonymStruct extends FFFirebaseStruct {
  SynonymStruct({
    String? name,
    List<String>? synonyms,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _synonyms = synonyms,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "synonyms" field.
  List<String>? _synonyms;
  List<String> get synonyms => _synonyms ?? const [];
  set synonyms(List<String>? val) => _synonyms = val;
  void updateSynonyms(Function(List<String>) updateFn) =>
      updateFn(_synonyms ??= []);
  bool hasSynonyms() => _synonyms != null;

  static SynonymStruct fromMap(Map<String, dynamic> data) => SynonymStruct(
        name: data['name'] as String?,
        synonyms: getDataList(data['synonyms']),
      );

  static SynonymStruct? maybeFromMap(dynamic data) =>
      data is Map ? SynonymStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'synonyms': _synonyms,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'synonyms': serializeParam(
          _synonyms,
          ParamType.String,
          true,
        ),
      }.withoutNulls;

  static SynonymStruct fromSerializableMap(Map<String, dynamic> data) =>
      SynonymStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        synonyms: deserializeParam<String>(
          data['synonyms'],
          ParamType.String,
          true,
        ),
      );

  static SynonymStruct fromAlgoliaData(Map<String, dynamic> data) =>
      SynonymStruct(
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        synonyms: convertAlgoliaParam<String>(
          data['synonyms'],
          ParamType.String,
          true,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'SynonymStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SynonymStruct &&
        name == other.name &&
        listEquality.equals(synonyms, other.synonyms);
  }

  @override
  int get hashCode => const ListEquality().hash([name, synonyms]);
}

SynonymStruct createSynonymStruct({
  String? name,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SynonymStruct(
      name: name,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SynonymStruct? updateSynonymStruct(
  SynonymStruct? synonym, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    synonym
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSynonymStructData(
  Map<String, dynamic> firestoreData,
  SynonymStruct? synonym,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (synonym == null) {
    return;
  }
  if (synonym.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && synonym.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final synonymData = getSynonymFirestoreData(synonym, forFieldValue);
  final nestedData = synonymData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = synonym.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSynonymFirestoreData(
  SynonymStruct? synonym, [
  bool forFieldValue = false,
]) {
  if (synonym == null) {
    return {};
  }
  final firestoreData = mapToFirestore(synonym.toMap());

  // Add any Firestore field values
  synonym.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSynonymListFirestoreData(
  List<SynonymStruct>? synonyms,
) =>
    synonyms?.map((e) => getSynonymFirestoreData(e, true)).toList() ?? [];
