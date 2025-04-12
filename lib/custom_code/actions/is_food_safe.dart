// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_util.dart';
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool> isFoodSafe(List<String>? foodAllergens) async {
  final usersAlergies = FFAppState().Allergies;

  // could be optimized using some better algorithm but not necessary now
  for (String allergen in usersAlergies) {
    if (foodAllergens!.contains(allergen.toLowerCase())) {
      return false;
    }
  }

  return true;
}
