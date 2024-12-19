// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductFromOFFStruct extends FFFirebaseStruct {
  ProductFromOFFStruct({
    int? novaGrade,
    double? ecoScore,
    EcoScoreGrades? ecoScoreGrade,
    NutriscoreLevels? nutriscoreFatLevel,
    NutriscoreLevels? nutriscoreSugarLevel,
    NutriscoreLevels? nutriscoreSaturatedFatLevel,
    NutriscoreLevels? nutriscoreSaltLevel,
    EcoScoreGrades? nutriscoreGrade,
    List<NovaGroupMarkerStruct>? novaGroupMarkers,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _novaGrade = novaGrade,
        _ecoScore = ecoScore,
        _ecoScoreGrade = ecoScoreGrade,
        _nutriscoreFatLevel = nutriscoreFatLevel,
        _nutriscoreSugarLevel = nutriscoreSugarLevel,
        _nutriscoreSaturatedFatLevel = nutriscoreSaturatedFatLevel,
        _nutriscoreSaltLevel = nutriscoreSaltLevel,
        _nutriscoreGrade = nutriscoreGrade,
        _novaGroupMarkers = novaGroupMarkers,
        super(firestoreUtilData);

  // "NovaGrade" field.
  int? _novaGrade;
  int get novaGrade => _novaGrade ?? 0;
  set novaGrade(int? val) => _novaGrade = val;

  void incrementNovaGrade(int amount) => novaGrade = novaGrade + amount;

  bool hasNovaGrade() => _novaGrade != null;

  // "EcoScore" field.
  double? _ecoScore;
  double get ecoScore => _ecoScore ?? 0.0;
  set ecoScore(double? val) => _ecoScore = val;

  void incrementEcoScore(double amount) => ecoScore = ecoScore + amount;

  bool hasEcoScore() => _ecoScore != null;

  // "EcoScoreGrade" field.
  EcoScoreGrades? _ecoScoreGrade;
  EcoScoreGrades get ecoScoreGrade => _ecoScoreGrade ?? EcoScoreGrades.none;
  set ecoScoreGrade(EcoScoreGrades? val) => _ecoScoreGrade = val;

  bool hasEcoScoreGrade() => _ecoScoreGrade != null;

  // "Nutriscore_FatLevel" field.
  NutriscoreLevels? _nutriscoreFatLevel;
  NutriscoreLevels get nutriscoreFatLevel =>
      _nutriscoreFatLevel ?? NutriscoreLevels.none;
  set nutriscoreFatLevel(NutriscoreLevels? val) => _nutriscoreFatLevel = val;

  bool hasNutriscoreFatLevel() => _nutriscoreFatLevel != null;

  // "Nutriscore_SugarLevel" field.
  NutriscoreLevels? _nutriscoreSugarLevel;
  NutriscoreLevels get nutriscoreSugarLevel =>
      _nutriscoreSugarLevel ?? NutriscoreLevels.none;
  set nutriscoreSugarLevel(NutriscoreLevels? val) =>
      _nutriscoreSugarLevel = val;

  bool hasNutriscoreSugarLevel() => _nutriscoreSugarLevel != null;

  // "Nutriscore_SaturatedFatLevel" field.
  NutriscoreLevels? _nutriscoreSaturatedFatLevel;
  NutriscoreLevels get nutriscoreSaturatedFatLevel =>
      _nutriscoreSaturatedFatLevel ?? NutriscoreLevels.none;
  set nutriscoreSaturatedFatLevel(NutriscoreLevels? val) =>
      _nutriscoreSaturatedFatLevel = val;

  bool hasNutriscoreSaturatedFatLevel() => _nutriscoreSaturatedFatLevel != null;

  // "Nutriscore_SaltLevel" field.
  NutriscoreLevels? _nutriscoreSaltLevel;
  NutriscoreLevels get nutriscoreSaltLevel =>
      _nutriscoreSaltLevel ?? NutriscoreLevels.none;
  set nutriscoreSaltLevel(NutriscoreLevels? val) => _nutriscoreSaltLevel = val;

  bool hasNutriscoreSaltLevel() => _nutriscoreSaltLevel != null;

  // "NutriscoreGrade" field.
  EcoScoreGrades? _nutriscoreGrade;
  EcoScoreGrades get nutriscoreGrade => _nutriscoreGrade ?? EcoScoreGrades.none;
  set nutriscoreGrade(EcoScoreGrades? val) => _nutriscoreGrade = val;

  bool hasNutriscoreGrade() => _nutriscoreGrade != null;

  // "Nova_group_markers" field.
  List<NovaGroupMarkerStruct>? _novaGroupMarkers;
  List<NovaGroupMarkerStruct> get novaGroupMarkers =>
      _novaGroupMarkers ?? const [];
  set novaGroupMarkers(List<NovaGroupMarkerStruct>? val) =>
      _novaGroupMarkers = val;

  void updateNovaGroupMarkers(Function(List<NovaGroupMarkerStruct>) updateFn) {
    updateFn(_novaGroupMarkers ??= []);
  }

  bool hasNovaGroupMarkers() => _novaGroupMarkers != null;

  static ProductFromOFFStruct fromMap(Map<String, dynamic> data) =>
      ProductFromOFFStruct(
        novaGrade: castToType<int>(data['NovaGrade']),
        ecoScore: castToType<double>(data['EcoScore']),
        ecoScoreGrade: data['EcoScoreGrade'] is EcoScoreGrades
            ? data['EcoScoreGrade']
            : deserializeEnum<EcoScoreGrades>(data['EcoScoreGrade']),
        nutriscoreFatLevel: data['Nutriscore_FatLevel'] is NutriscoreLevels
            ? data['Nutriscore_FatLevel']
            : deserializeEnum<NutriscoreLevels>(data['Nutriscore_FatLevel']),
        nutriscoreSugarLevel: data['Nutriscore_SugarLevel'] is NutriscoreLevels
            ? data['Nutriscore_SugarLevel']
            : deserializeEnum<NutriscoreLevels>(data['Nutriscore_SugarLevel']),
        nutriscoreSaturatedFatLevel:
            data['Nutriscore_SaturatedFatLevel'] is NutriscoreLevels
                ? data['Nutriscore_SaturatedFatLevel']
                : deserializeEnum<NutriscoreLevels>(
                    data['Nutriscore_SaturatedFatLevel']),
        nutriscoreSaltLevel: data['Nutriscore_SaltLevel'] is NutriscoreLevels
            ? data['Nutriscore_SaltLevel']
            : deserializeEnum<NutriscoreLevels>(data['Nutriscore_SaltLevel']),
        nutriscoreGrade: data['NutriscoreGrade'] is EcoScoreGrades
            ? data['NutriscoreGrade']
            : deserializeEnum<EcoScoreGrades>(data['NutriscoreGrade']),
        novaGroupMarkers: getStructList(
          data['Nova_group_markers'],
          NovaGroupMarkerStruct.fromMap,
        ),
      );

  static ProductFromOFFStruct? maybeFromMap(dynamic data) => data is Map
      ? ProductFromOFFStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'NovaGrade': _novaGrade,
        'EcoScore': _ecoScore,
        'EcoScoreGrade': _ecoScoreGrade?.serialize(),
        'Nutriscore_FatLevel': _nutriscoreFatLevel?.serialize(),
        'Nutriscore_SugarLevel': _nutriscoreSugarLevel?.serialize(),
        'Nutriscore_SaturatedFatLevel':
            _nutriscoreSaturatedFatLevel?.serialize(),
        'Nutriscore_SaltLevel': _nutriscoreSaltLevel?.serialize(),
        'NutriscoreGrade': _nutriscoreGrade?.serialize(),
        'Nova_group_markers': _novaGroupMarkers?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'NovaGrade': serializeParam(
          _novaGrade,
          ParamType.int,
        ),
        'EcoScore': serializeParam(
          _ecoScore,
          ParamType.double,
        ),
        'EcoScoreGrade': serializeParam(
          _ecoScoreGrade,
          ParamType.Enum,
        ),
        'Nutriscore_FatLevel': serializeParam(
          _nutriscoreFatLevel,
          ParamType.Enum,
        ),
        'Nutriscore_SugarLevel': serializeParam(
          _nutriscoreSugarLevel,
          ParamType.Enum,
        ),
        'Nutriscore_SaturatedFatLevel': serializeParam(
          _nutriscoreSaturatedFatLevel,
          ParamType.Enum,
        ),
        'Nutriscore_SaltLevel': serializeParam(
          _nutriscoreSaltLevel,
          ParamType.Enum,
        ),
        'NutriscoreGrade': serializeParam(
          _nutriscoreGrade,
          ParamType.Enum,
        ),
        'Nova_group_markers': serializeParam(
          _novaGroupMarkers,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static ProductFromOFFStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProductFromOFFStruct(
        novaGrade: deserializeParam(
          data['NovaGrade'],
          ParamType.int,
          false,
        ),
        ecoScore: deserializeParam(
          data['EcoScore'],
          ParamType.double,
          false,
        ),
        ecoScoreGrade: deserializeParam<EcoScoreGrades>(
          data['EcoScoreGrade'],
          ParamType.Enum,
          false,
        ),
        nutriscoreFatLevel: deserializeParam<NutriscoreLevels>(
          data['Nutriscore_FatLevel'],
          ParamType.Enum,
          false,
        ),
        nutriscoreSugarLevel: deserializeParam<NutriscoreLevels>(
          data['Nutriscore_SugarLevel'],
          ParamType.Enum,
          false,
        ),
        nutriscoreSaturatedFatLevel: deserializeParam<NutriscoreLevels>(
          data['Nutriscore_SaturatedFatLevel'],
          ParamType.Enum,
          false,
        ),
        nutriscoreSaltLevel: deserializeParam<NutriscoreLevels>(
          data['Nutriscore_SaltLevel'],
          ParamType.Enum,
          false,
        ),
        nutriscoreGrade: deserializeParam<EcoScoreGrades>(
          data['NutriscoreGrade'],
          ParamType.Enum,
          false,
        ),
        novaGroupMarkers: deserializeStructParam<NovaGroupMarkerStruct>(
          data['Nova_group_markers'],
          ParamType.DataStruct,
          true,
          structBuilder: NovaGroupMarkerStruct.fromSerializableMap,
        ),
      );

  static ProductFromOFFStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ProductFromOFFStruct(
        novaGrade: convertAlgoliaParam(
          data['NovaGrade'],
          ParamType.int,
          false,
        ),
        ecoScore: convertAlgoliaParam(
          data['EcoScore'],
          ParamType.double,
          false,
        ),
        ecoScoreGrade: convertAlgoliaParam<EcoScoreGrades>(
          data['EcoScoreGrade'],
          ParamType.Enum,
          false,
        ),
        nutriscoreFatLevel: convertAlgoliaParam<NutriscoreLevels>(
          data['Nutriscore_FatLevel'],
          ParamType.Enum,
          false,
        ),
        nutriscoreSugarLevel: convertAlgoliaParam<NutriscoreLevels>(
          data['Nutriscore_SugarLevel'],
          ParamType.Enum,
          false,
        ),
        nutriscoreSaturatedFatLevel: convertAlgoliaParam<NutriscoreLevels>(
          data['Nutriscore_SaturatedFatLevel'],
          ParamType.Enum,
          false,
        ),
        nutriscoreSaltLevel: convertAlgoliaParam<NutriscoreLevels>(
          data['Nutriscore_SaltLevel'],
          ParamType.Enum,
          false,
        ),
        nutriscoreGrade: convertAlgoliaParam<EcoScoreGrades>(
          data['NutriscoreGrade'],
          ParamType.Enum,
          false,
        ),
        novaGroupMarkers: convertAlgoliaParam<NovaGroupMarkerStruct>(
          data['Nova_group_markers'],
          ParamType.DataStruct,
          true,
          structBuilder: NovaGroupMarkerStruct.fromAlgoliaData,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ProductFromOFFStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ProductFromOFFStruct &&
        novaGrade == other.novaGrade &&
        ecoScore == other.ecoScore &&
        ecoScoreGrade == other.ecoScoreGrade &&
        nutriscoreFatLevel == other.nutriscoreFatLevel &&
        nutriscoreSugarLevel == other.nutriscoreSugarLevel &&
        nutriscoreSaturatedFatLevel == other.nutriscoreSaturatedFatLevel &&
        nutriscoreSaltLevel == other.nutriscoreSaltLevel &&
        nutriscoreGrade == other.nutriscoreGrade &&
        listEquality.equals(novaGroupMarkers, other.novaGroupMarkers);
  }

  @override
  int get hashCode => const ListEquality().hash([
        novaGrade,
        ecoScore,
        ecoScoreGrade,
        nutriscoreFatLevel,
        nutriscoreSugarLevel,
        nutriscoreSaturatedFatLevel,
        nutriscoreSaltLevel,
        nutriscoreGrade,
        novaGroupMarkers
      ]);
}

ProductFromOFFStruct createProductFromOFFStruct({
  int? novaGrade,
  double? ecoScore,
  EcoScoreGrades? ecoScoreGrade,
  NutriscoreLevels? nutriscoreFatLevel,
  NutriscoreLevels? nutriscoreSugarLevel,
  NutriscoreLevels? nutriscoreSaturatedFatLevel,
  NutriscoreLevels? nutriscoreSaltLevel,
  EcoScoreGrades? nutriscoreGrade,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProductFromOFFStruct(
      novaGrade: novaGrade,
      ecoScore: ecoScore,
      ecoScoreGrade: ecoScoreGrade,
      nutriscoreFatLevel: nutriscoreFatLevel,
      nutriscoreSugarLevel: nutriscoreSugarLevel,
      nutriscoreSaturatedFatLevel: nutriscoreSaturatedFatLevel,
      nutriscoreSaltLevel: nutriscoreSaltLevel,
      nutriscoreGrade: nutriscoreGrade,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProductFromOFFStruct? updateProductFromOFFStruct(
  ProductFromOFFStruct? productFromOFF, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    productFromOFF
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProductFromOFFStructData(
  Map<String, dynamic> firestoreData,
  ProductFromOFFStruct? productFromOFF,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (productFromOFF == null) {
    return;
  }
  if (productFromOFF.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && productFromOFF.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final productFromOFFData =
      getProductFromOFFFirestoreData(productFromOFF, forFieldValue);
  final nestedData =
      productFromOFFData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = productFromOFF.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProductFromOFFFirestoreData(
  ProductFromOFFStruct? productFromOFF, [
  bool forFieldValue = false,
]) {
  if (productFromOFF == null) {
    return {};
  }
  final firestoreData = mapToFirestore(productFromOFF.toMap());

  // Add any Firestore field values
  productFromOFF.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProductFromOFFListFirestoreData(
  List<ProductFromOFFStruct>? productFromOFFs,
) =>
    productFromOFFs
        ?.map((e) => getProductFromOFFFirestoreData(e, true))
        .toList() ??
    [];
