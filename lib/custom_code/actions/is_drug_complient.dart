// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool> isDrugComplient(ProductsRecord? product) async {
  if (product == null) {
    return false;
  }
  // Add your function code here!

  final medications = FFAppState().Medication;

  for (var medication in medications) {
    var res = await getMedicationStruct(medication, product);
    if (!res.isSafe) {
      return false;
    }
  }

  return true;
}
