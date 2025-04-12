// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductsStruct extends FFFirebaseStruct {
  ProductsStruct({
    List<String>? addressLines,
    String? category,
    String? foodType,
    bool? isCompleted,
    String? name,
    List<IngredientStruct>? ingredients,
    String? origin,
    String? size,
    String? sizeUnit,
    List<NutrientStruct>? nutrients,
    String? ean,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _addressLines = addressLines,
        _category = category,
        _foodType = foodType,
        _isCompleted = isCompleted,
        _name = name,
        _ingredients = ingredients,
        _origin = origin,
        _size = size,
        _sizeUnit = sizeUnit,
        _nutrients = nutrients,
        _ean = ean,
        super(firestoreUtilData);

  // "AddressLines" field.
  List<String>? _addressLines;
  List<String> get addressLines => _addressLines ?? const [];
  set addressLines(List<String>? val) => _addressLines = val;

  void updateAddressLines(Function(List<String>) updateFn) {
    updateFn(_addressLines ??= []);
  }

  bool hasAddressLines() => _addressLines != null;

  // "Category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;

  bool hasCategory() => _category != null;

  // "FoodType" field.
  String? _foodType;
  String get foodType => _foodType ?? '';
  set foodType(String? val) => _foodType = val;

  bool hasFoodType() => _foodType != null;

  // "IsCompleted" field.
  bool? _isCompleted;
  bool get isCompleted => _isCompleted ?? false;
  set isCompleted(bool? val) => _isCompleted = val;

  bool hasIsCompleted() => _isCompleted != null;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "Ingredients" field.
  List<IngredientStruct>? _ingredients;
  List<IngredientStruct> get ingredients => _ingredients ?? const [];
  set ingredients(List<IngredientStruct>? val) => _ingredients = val;

  void updateIngredients(Function(List<IngredientStruct>) updateFn) {
    updateFn(_ingredients ??= []);
  }

  bool hasIngredients() => _ingredients != null;

  // "Origin" field.
  String? _origin;
  String get origin => _origin ?? '';
  set origin(String? val) => _origin = val;

  bool hasOrigin() => _origin != null;

  // "Size" field.
  String? _size;
  String get size => _size ?? '';
  set size(String? val) => _size = val;

  bool hasSize() => _size != null;

  // "SizeUnit" field.
  String? _sizeUnit;
  String get sizeUnit => _sizeUnit ?? '';
  set sizeUnit(String? val) => _sizeUnit = val;

  bool hasSizeUnit() => _sizeUnit != null;

  // "Nutrients" field.
  List<NutrientStruct>? _nutrients;
  List<NutrientStruct> get nutrients => _nutrients ?? const [];
  set nutrients(List<NutrientStruct>? val) => _nutrients = val;

  void updateNutrients(Function(List<NutrientStruct>) updateFn) {
    updateFn(_nutrients ??= []);
  }

  bool hasNutrients() => _nutrients != null;

  // "EAN" field.
  String? _ean;
  String get ean => _ean ?? '';
  set ean(String? val) => _ean = val;

  bool hasEan() => _ean != null;

  static ProductsStruct fromMap(Map<String, dynamic> data) => ProductsStruct(
        addressLines: getDataList(data['AddressLines']),
        category: data['Category'] as String?,
        foodType: data['FoodType'] as String?,
        isCompleted: data['IsCompleted'] as bool?,
        name: data['Name'] as String?,
        ingredients: getStructList(
          data['Ingredients'],
          IngredientStruct.fromMap,
        ),
        origin: data['Origin'] as String?,
        size: data['Size'] as String?,
        sizeUnit: data['SizeUnit'] as String?,
        nutrients: getStructList(
          data['Nutrients'],
          NutrientStruct.fromMap,
        ),
        ean: data['EAN'] as String?,
      );

  static ProductsStruct? maybeFromMap(dynamic data) =>
      data is Map ? ProductsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'AddressLines': _addressLines,
        'Category': _category,
        'FoodType': _foodType,
        'IsCompleted': _isCompleted,
        'Name': _name,
        'Ingredients': _ingredients?.map((e) => e.toMap()).toList(),
        'Origin': _origin,
        'Size': _size,
        'SizeUnit': _sizeUnit,
        'Nutrients': _nutrients?.map((e) => e.toMap()).toList(),
        'EAN': _ean,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'AddressLines': serializeParam(
          _addressLines,
          ParamType.String,
          isList: true,
        ),
        'Category': serializeParam(
          _category,
          ParamType.String,
        ),
        'FoodType': serializeParam(
          _foodType,
          ParamType.String,
        ),
        'IsCompleted': serializeParam(
          _isCompleted,
          ParamType.bool,
        ),
        'Name': serializeParam(
          _name,
          ParamType.String,
        ),
        'Ingredients': serializeParam(
          _ingredients,
          ParamType.DataStruct,
          isList: true,
        ),
        'Origin': serializeParam(
          _origin,
          ParamType.String,
        ),
        'Size': serializeParam(
          _size,
          ParamType.String,
        ),
        'SizeUnit': serializeParam(
          _sizeUnit,
          ParamType.String,
        ),
        'Nutrients': serializeParam(
          _nutrients,
          ParamType.DataStruct,
          isList: true,
        ),
        'EAN': serializeParam(
          _ean,
          ParamType.String,
        ),
      }.withoutNulls;

  static ProductsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProductsStruct(
        addressLines: deserializeParam<String>(
          data['AddressLines'],
          ParamType.String,
          true,
        ),
        category: deserializeParam(
          data['Category'],
          ParamType.String,
          false,
        ),
        foodType: deserializeParam(
          data['FoodType'],
          ParamType.String,
          false,
        ),
        isCompleted: deserializeParam(
          data['IsCompleted'],
          ParamType.bool,
          false,
        ),
        name: deserializeParam(
          data['Name'],
          ParamType.String,
          false,
        ),
        ingredients: deserializeStructParam<IngredientStruct>(
          data['Ingredients'],
          ParamType.DataStruct,
          true,
          structBuilder: IngredientStruct.fromSerializableMap,
        ),
        origin: deserializeParam(
          data['Origin'],
          ParamType.String,
          false,
        ),
        size: deserializeParam(
          data['Size'],
          ParamType.String,
          false,
        ),
        sizeUnit: deserializeParam(
          data['SizeUnit'],
          ParamType.String,
          false,
        ),
        nutrients: deserializeStructParam<NutrientStruct>(
          data['Nutrients'],
          ParamType.DataStruct,
          true,
          structBuilder: NutrientStruct.fromSerializableMap,
        ),
        ean: deserializeParam(
          data['EAN'],
          ParamType.String,
          false,
        ),
      );

  static ProductsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ProductsStruct(
        addressLines: convertAlgoliaParam<String>(
          data['AddressLines'],
          ParamType.String,
          true,
        ),
        category: convertAlgoliaParam(
          data['Category'],
          ParamType.String,
          false,
        ),
        foodType: convertAlgoliaParam(
          data['FoodType'],
          ParamType.String,
          false,
        ),
        isCompleted: convertAlgoliaParam(
          data['IsCompleted'],
          ParamType.bool,
          false,
        ),
        name: convertAlgoliaParam(
          data['Name'],
          ParamType.String,
          false,
        ),
        ingredients: convertAlgoliaParam<IngredientStruct>(
          data['Ingredients'],
          ParamType.DataStruct,
          true,
          structBuilder: IngredientStruct.fromAlgoliaData,
        ),
        origin: convertAlgoliaParam(
          data['Origin'],
          ParamType.String,
          false,
        ),
        size: convertAlgoliaParam(
          data['Size'],
          ParamType.String,
          false,
        ),
        sizeUnit: convertAlgoliaParam(
          data['SizeUnit'],
          ParamType.String,
          false,
        ),
        nutrients: convertAlgoliaParam<NutrientStruct>(
          data['Nutrients'],
          ParamType.DataStruct,
          true,
          structBuilder: NutrientStruct.fromAlgoliaData,
        ),
        ean: convertAlgoliaParam(
          data['EAN'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ProductsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ProductsStruct &&
        listEquality.equals(addressLines, other.addressLines) &&
        category == other.category &&
        foodType == other.foodType &&
        isCompleted == other.isCompleted &&
        name == other.name &&
        listEquality.equals(ingredients, other.ingredients) &&
        origin == other.origin &&
        size == other.size &&
        sizeUnit == other.sizeUnit &&
        listEquality.equals(nutrients, other.nutrients) &&
        ean == other.ean;
  }

  @override
  int get hashCode => const ListEquality().hash([
        addressLines,
        category,
        foodType,
        isCompleted,
        name,
        ingredients,
        origin,
        size,
        sizeUnit,
        nutrients,
        ean
      ]);
}

ProductsStruct createProductsStruct({
  String? category,
  String? foodType,
  bool? isCompleted,
  String? name,
  String? origin,
  String? size,
  String? sizeUnit,
  String? ean,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProductsStruct(
      category: category,
      foodType: foodType,
      isCompleted: isCompleted,
      name: name,
      origin: origin,
      size: size,
      sizeUnit: sizeUnit,
      ean: ean,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProductsStruct? updateProductsStruct(
  ProductsStruct? products, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    products
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProductsStructData(
  Map<String, dynamic> firestoreData,
  ProductsStruct? products,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (products == null) {
    return;
  }
  if (products.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && products.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final productsData = getProductsFirestoreData(products, forFieldValue);
  final nestedData = productsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = products.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProductsFirestoreData(
  ProductsStruct? products, [
  bool forFieldValue = false,
]) {
  if (products == null) {
    return {};
  }
  final firestoreData = mapToFirestore(products.toMap());

  // Add any Firestore field values
  products.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProductsListFirestoreData(
  List<ProductsStruct>? productss,
) =>
    productss?.map((e) => getProductsFirestoreData(e, true)).toList() ?? [];
