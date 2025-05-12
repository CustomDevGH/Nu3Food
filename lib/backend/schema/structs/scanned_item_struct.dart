// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ScannedItemStruct extends FFFirebaseStruct {
  ScannedItemStruct({
    String? ean,
    DateTime? lastScanned,
    bool? isFavourite,
    int? numberOfScans,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _ean = ean,
        _lastScanned = lastScanned,
        _isFavourite = isFavourite,
        _numberOfScans = numberOfScans,
        super(firestoreUtilData);

  // "EAN" field.
  String? _ean;
  String get ean => _ean ?? '';
  set ean(String? val) => _ean = val;

  bool hasEan() => _ean != null;

  // "LastScanned" field.
  DateTime? _lastScanned;
  DateTime? get lastScanned => _lastScanned;
  set lastScanned(DateTime? val) => _lastScanned = val;

  bool hasLastScanned() => _lastScanned != null;

  // "IsFavourite" field.
  bool? _isFavourite;
  bool get isFavourite => _isFavourite ?? false;
  set isFavourite(bool? val) => _isFavourite = val;

  bool hasIsFavourite() => _isFavourite != null;

  // "NumberOfScans" field.
  int? _numberOfScans;
  int get numberOfScans => _numberOfScans ?? 0;
  set numberOfScans(int? val) => _numberOfScans = val;

  void incrementNumberOfScans(int amount) =>
      numberOfScans = numberOfScans + amount;

  bool hasNumberOfScans() => _numberOfScans != null;

  static ScannedItemStruct fromMap(Map<String, dynamic> data) =>
      ScannedItemStruct(
        ean: data['EAN'] as String?,
        lastScanned: data['LastScanned'] as DateTime?,
        isFavourite: data['IsFavourite'] as bool?,
        numberOfScans: castToType<int>(data['NumberOfScans']),
      );

  static ScannedItemStruct? maybeFromMap(dynamic data) => data is Map
      ? ScannedItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'EAN': _ean,
        'LastScanned': _lastScanned,
        'IsFavourite': _isFavourite,
        'NumberOfScans': _numberOfScans,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'EAN': serializeParam(
          _ean,
          ParamType.String,
        ),
        'LastScanned': serializeParam(
          _lastScanned,
          ParamType.DateTime,
        ),
        'IsFavourite': serializeParam(
          _isFavourite,
          ParamType.bool,
        ),
        'NumberOfScans': serializeParam(
          _numberOfScans,
          ParamType.int,
        ),
      }.withoutNulls;

  static ScannedItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      ScannedItemStruct(
        ean: deserializeParam(
          data['EAN'],
          ParamType.String,
          false,
        ),
        lastScanned: deserializeParam(
          data['LastScanned'],
          ParamType.DateTime,
          false,
        ),
        isFavourite: deserializeParam(
          data['IsFavourite'],
          ParamType.bool,
          false,
        ),
        numberOfScans: deserializeParam(
          data['NumberOfScans'],
          ParamType.int,
          false,
        ),
      );

  static ScannedItemStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ScannedItemStruct(
        ean: convertAlgoliaParam(
          data['EAN'],
          ParamType.String,
          false,
        ),
        lastScanned: convertAlgoliaParam(
          data['LastScanned'],
          ParamType.DateTime,
          false,
        ),
        isFavourite: convertAlgoliaParam(
          data['IsFavourite'],
          ParamType.bool,
          false,
        ),
        numberOfScans: convertAlgoliaParam(
          data['NumberOfScans'],
          ParamType.int,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ScannedItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ScannedItemStruct &&
        ean == other.ean &&
        lastScanned == other.lastScanned &&
        isFavourite == other.isFavourite &&
        numberOfScans == other.numberOfScans;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([ean, lastScanned, isFavourite, numberOfScans]);
}

ScannedItemStruct createScannedItemStruct({
  String? ean,
  DateTime? lastScanned,
  bool? isFavourite,
  int? numberOfScans,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ScannedItemStruct(
      ean: ean,
      lastScanned: lastScanned,
      isFavourite: isFavourite,
      numberOfScans: numberOfScans,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ScannedItemStruct? updateScannedItemStruct(
  ScannedItemStruct? scannedItem, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    scannedItem
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addScannedItemStructData(
  Map<String, dynamic> firestoreData,
  ScannedItemStruct? scannedItem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (scannedItem == null) {
    return;
  }
  if (scannedItem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && scannedItem.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final scannedItemData =
      getScannedItemFirestoreData(scannedItem, forFieldValue);
  final nestedData =
      scannedItemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = scannedItem.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getScannedItemFirestoreData(
  ScannedItemStruct? scannedItem, [
  bool forFieldValue = false,
]) {
  if (scannedItem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(scannedItem.toMap());

  // Add any Firestore field values
  scannedItem.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getScannedItemListFirestoreData(
  List<ScannedItemStruct>? scannedItems,
) =>
    scannedItems?.map((e) => getScannedItemFirestoreData(e, true)).toList() ??
    [];
