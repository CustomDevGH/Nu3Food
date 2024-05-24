// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
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
