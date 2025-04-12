import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RequestedEansRecord extends FirestoreRecord {
  RequestedEansRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "ean" field.
  String? _ean;
  String get ean => _ean ?? '';
  bool hasEan() => _ean != null;

  // "createdBy" field.
  String? _createdBy;
  String get createdBy => _createdBy ?? '';
  bool hasCreatedBy() => _createdBy != null;

  // "creationTime" field.
  DateTime? _creationTime;
  DateTime? get creationTime => _creationTime;
  bool hasCreationTime() => _creationTime != null;

  void _initializeFields() {
    _ean = snapshotData['ean'] as String?;
    _createdBy = snapshotData['createdBy'] as String?;
    _creationTime = snapshotData['creationTime'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('requestedEans');

  static Stream<RequestedEansRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RequestedEansRecord.fromSnapshot(s));

  static Future<RequestedEansRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RequestedEansRecord.fromSnapshot(s));

  static RequestedEansRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RequestedEansRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RequestedEansRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RequestedEansRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RequestedEansRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RequestedEansRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRequestedEansRecordData({
  String? ean,
  String? createdBy,
  DateTime? creationTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ean': ean,
      'createdBy': createdBy,
      'creationTime': creationTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class RequestedEansRecordDocumentEquality
    implements Equality<RequestedEansRecord> {
  const RequestedEansRecordDocumentEquality();

  @override
  bool equals(RequestedEansRecord? e1, RequestedEansRecord? e2) {
    return e1?.ean == e2?.ean &&
        e1?.createdBy == e2?.createdBy &&
        e1?.creationTime == e2?.creationTime;
  }

  @override
  int hash(RequestedEansRecord? e) =>
      const ListEquality().hash([e?.ean, e?.createdBy, e?.creationTime]);

  @override
  bool isValidKey(Object? o) => o is RequestedEansRecord;
}
