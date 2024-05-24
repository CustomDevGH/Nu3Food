import 'package:collection/collection.dart';

enum EcoScoreGrades {
  a,
  b,
  c,
  d,
  e,
  f,
  none,
}

enum NutriscoreLevels {
  low,
  moderate,
  high,
  none,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (EcoScoreGrades):
      return EcoScoreGrades.values.deserialize(value) as T?;
    case (NutriscoreLevels):
      return NutriscoreLevels.values.deserialize(value) as T?;
    default:
      return null;
  }
}
