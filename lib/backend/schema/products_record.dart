import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductsRecord extends FirestoreRecord {
  ProductsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "IsCompleted" field.
  bool? _isCompleted;
  bool get isCompleted => _isCompleted ?? false;
  bool hasIsCompleted() => _isCompleted != null;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "Category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "Allergens" field.
  List<String>? _allergens;
  List<String> get allergens => _allergens ?? const [];
  bool hasAllergens() => _allergens != null;

  // "Ingredients" field.
  List<IngredientStruct>? _ingredients;
  List<IngredientStruct> get ingredients => _ingredients ?? const [];
  bool hasIngredients() => _ingredients != null;

  // "AddressLines" field.
  List<String>? _addressLines;
  List<String> get addressLines => _addressLines ?? const [];
  bool hasAddressLines() => _addressLines != null;

  // "Nutrients" field.
  List<NutrientStruct>? _nutrients;
  List<NutrientStruct> get nutrients => _nutrients ?? const [];
  bool hasNutrients() => _nutrients != null;

  // "Origin" field.
  String? _origin;
  String get origin => _origin ?? '';
  bool hasOrigin() => _origin != null;

  // "Size" field.
  String? _size;
  String get size => _size ?? '';
  bool hasSize() => _size != null;

  // "SizeUnit" field.
  String? _sizeUnit;
  String get sizeUnit => _sizeUnit ?? '';
  bool hasSizeUnit() => _sizeUnit != null;

  // "NutriScoreGrade" field.
  String? _nutriScoreGrade;
  String get nutriScoreGrade => _nutriScoreGrade ?? '';
  bool hasNutriScoreGrade() => _nutriScoreGrade != null;

  void _initializeFields() {
    _isCompleted = snapshotData['IsCompleted'] as bool?;
    _name = snapshotData['Name'] as String?;
    _category = snapshotData['Category'] as String?;
    _allergens = getDataList(snapshotData['Allergens']);
    _ingredients = getStructList(
      snapshotData['Ingredients'],
      IngredientStruct.fromMap,
    );
    _addressLines = getDataList(snapshotData['AddressLines']);
    _nutrients = getStructList(
      snapshotData['Nutrients'],
      NutrientStruct.fromMap,
    );
    _origin = snapshotData['Origin'] as String?;
    _size = snapshotData['Size'] as String?;
    _sizeUnit = snapshotData['SizeUnit'] as String?;
    _nutriScoreGrade = snapshotData['NutriScoreGrade'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('products');

  static Stream<ProductsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductsRecord.fromSnapshot(s));

  static Future<ProductsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductsRecord.fromSnapshot(s));

  static ProductsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductsRecordData({
  bool? isCompleted,
  String? name,
  String? category,
  String? origin,
  String? size,
  String? sizeUnit,
  String? nutriScoreGrade,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'IsCompleted': isCompleted,
      'Name': name,
      'Category': category,
      'Origin': origin,
      'Size': size,
      'SizeUnit': sizeUnit,
      'NutriScoreGrade': nutriScoreGrade,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductsRecordDocumentEquality implements Equality<ProductsRecord> {
  const ProductsRecordDocumentEquality();

  @override
  bool equals(ProductsRecord? e1, ProductsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.isCompleted == e2?.isCompleted &&
        e1?.name == e2?.name &&
        e1?.category == e2?.category &&
        listEquality.equals(e1?.allergens, e2?.allergens) &&
        listEquality.equals(e1?.ingredients, e2?.ingredients) &&
        listEquality.equals(e1?.addressLines, e2?.addressLines) &&
        listEquality.equals(e1?.nutrients, e2?.nutrients) &&
        e1?.origin == e2?.origin &&
        e1?.size == e2?.size &&
        e1?.sizeUnit == e2?.sizeUnit &&
        e1?.nutriScoreGrade == e2?.nutriScoreGrade;
  }

  @override
  int hash(ProductsRecord? e) => const ListEquality().hash([
        e?.isCompleted,
        e?.name,
        e?.category,
        e?.allergens,
        e?.ingredients,
        e?.addressLines,
        e?.nutrients,
        e?.origin,
        e?.size,
        e?.sizeUnit,
        e?.nutriScoreGrade
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductsRecord;
}
