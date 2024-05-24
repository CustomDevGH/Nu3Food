import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SynonymsRecord extends FirestoreRecord {
  SynonymsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "synonyms" field.
  List<String>? _synonyms;
  List<String> get synonyms => _synonyms ?? const [];
  bool hasSynonyms() => _synonyms != null;

  void _initializeFields() {
    _synonyms = getDataList(snapshotData['synonyms']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('synonyms');

  static Stream<SynonymsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SynonymsRecord.fromSnapshot(s));

  static Future<SynonymsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SynonymsRecord.fromSnapshot(s));

  static SynonymsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SynonymsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SynonymsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SynonymsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SynonymsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SynonymsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSynonymsRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class SynonymsRecordDocumentEquality implements Equality<SynonymsRecord> {
  const SynonymsRecordDocumentEquality();

  @override
  bool equals(SynonymsRecord? e1, SynonymsRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.synonyms, e2?.synonyms);
  }

  @override
  int hash(SynonymsRecord? e) => const ListEquality().hash([e?.synonyms]);

  @override
  bool isValidKey(Object? o) => o is SynonymsRecord;
}
