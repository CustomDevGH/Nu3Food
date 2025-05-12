import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExpiredFoodRecord extends FirestoreRecord {
  ExpiredFoodRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "EAN" field.
  String? _ean;
  String get ean => _ean ?? '';
  bool hasEan() => _ean != null;

  // "DateOfCreation" field.
  DateTime? _dateOfCreation;
  DateTime? get dateOfCreation => _dateOfCreation;
  bool hasDateOfCreation() => _dateOfCreation != null;

  // "DateOfExpiration" field.
  DateTime? _dateOfExpiration;
  DateTime? get dateOfExpiration => _dateOfExpiration;
  bool hasDateOfExpiration() => _dateOfExpiration != null;

  // "CreationDate" field.
  DateTime? _creationDate;
  DateTime? get creationDate => _creationDate;
  bool hasCreationDate() => _creationDate != null;

  // "UserId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  void _initializeFields() {
    _location = snapshotData['Location'] as LatLng?;
    _name = snapshotData['Name'] as String?;
    _ean = snapshotData['EAN'] as String?;
    _dateOfCreation = snapshotData['DateOfCreation'] as DateTime?;
    _dateOfExpiration = snapshotData['DateOfExpiration'] as DateTime?;
    _creationDate = snapshotData['CreationDate'] as DateTime?;
    _userId = snapshotData['UserId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ExpiredFood');

  static Stream<ExpiredFoodRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ExpiredFoodRecord.fromSnapshot(s));

  static Future<ExpiredFoodRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ExpiredFoodRecord.fromSnapshot(s));

  static ExpiredFoodRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ExpiredFoodRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ExpiredFoodRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ExpiredFoodRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ExpiredFoodRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ExpiredFoodRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createExpiredFoodRecordData({
  LatLng? location,
  String? name,
  String? ean,
  DateTime? dateOfCreation,
  DateTime? dateOfExpiration,
  DateTime? creationDate,
  String? userId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Location': location,
      'Name': name,
      'EAN': ean,
      'DateOfCreation': dateOfCreation,
      'DateOfExpiration': dateOfExpiration,
      'CreationDate': creationDate,
      'UserId': userId,
    }.withoutNulls,
  );

  return firestoreData;
}

class ExpiredFoodRecordDocumentEquality implements Equality<ExpiredFoodRecord> {
  const ExpiredFoodRecordDocumentEquality();

  @override
  bool equals(ExpiredFoodRecord? e1, ExpiredFoodRecord? e2) {
    return e1?.location == e2?.location &&
        e1?.name == e2?.name &&
        e1?.ean == e2?.ean &&
        e1?.dateOfCreation == e2?.dateOfCreation &&
        e1?.dateOfExpiration == e2?.dateOfExpiration &&
        e1?.creationDate == e2?.creationDate &&
        e1?.userId == e2?.userId;
  }

  @override
  int hash(ExpiredFoodRecord? e) => const ListEquality().hash([
        e?.location,
        e?.name,
        e?.ean,
        e?.dateOfCreation,
        e?.dateOfExpiration,
        e?.creationDate,
        e?.userId
      ]);

  @override
  bool isValidKey(Object? o) => o is ExpiredFoodRecord;
}
