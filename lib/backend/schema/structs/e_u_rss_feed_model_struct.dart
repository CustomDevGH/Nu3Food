// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class EURssFeedModelStruct extends FFFirebaseStruct {
  EURssFeedModelStruct({
    String? title,
    String? link,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _link = link,
        super(firestoreUtilData);

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "Link" field.
  String? _link;
  String get link => _link ?? '';
  set link(String? val) => _link = val;

  bool hasLink() => _link != null;

  static EURssFeedModelStruct fromMap(Map<String, dynamic> data) =>
      EURssFeedModelStruct(
        title: data['Title'] as String?,
        link: data['Link'] as String?,
      );

  static EURssFeedModelStruct? maybeFromMap(dynamic data) => data is Map
      ? EURssFeedModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Title': _title,
        'Link': _link,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Title': serializeParam(
          _title,
          ParamType.String,
        ),
        'Link': serializeParam(
          _link,
          ParamType.String,
        ),
      }.withoutNulls;

  static EURssFeedModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      EURssFeedModelStruct(
        title: deserializeParam(
          data['Title'],
          ParamType.String,
          false,
        ),
        link: deserializeParam(
          data['Link'],
          ParamType.String,
          false,
        ),
      );

  static EURssFeedModelStruct fromAlgoliaData(Map<String, dynamic> data) =>
      EURssFeedModelStruct(
        title: convertAlgoliaParam(
          data['Title'],
          ParamType.String,
          false,
        ),
        link: convertAlgoliaParam(
          data['Link'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'EURssFeedModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EURssFeedModelStruct &&
        title == other.title &&
        link == other.link;
  }

  @override
  int get hashCode => const ListEquality().hash([title, link]);
}

EURssFeedModelStruct createEURssFeedModelStruct({
  String? title,
  String? link,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EURssFeedModelStruct(
      title: title,
      link: link,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EURssFeedModelStruct? updateEURssFeedModelStruct(
  EURssFeedModelStruct? eURssFeedModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    eURssFeedModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEURssFeedModelStructData(
  Map<String, dynamic> firestoreData,
  EURssFeedModelStruct? eURssFeedModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (eURssFeedModel == null) {
    return;
  }
  if (eURssFeedModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && eURssFeedModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final eURssFeedModelData =
      getEURssFeedModelFirestoreData(eURssFeedModel, forFieldValue);
  final nestedData =
      eURssFeedModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = eURssFeedModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEURssFeedModelFirestoreData(
  EURssFeedModelStruct? eURssFeedModel, [
  bool forFieldValue = false,
]) {
  if (eURssFeedModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(eURssFeedModel.toMap());

  // Add any Firestore field values
  eURssFeedModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEURssFeedModelListFirestoreData(
  List<EURssFeedModelStruct>? eURssFeedModels,
) =>
    eURssFeedModels
        ?.map((e) => getEURssFeedModelFirestoreData(e, true))
        .toList() ??
    [];
