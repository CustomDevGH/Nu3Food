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

Future<ProductsRecord?> getFoodFromEAN(String ean, bool? updateFood) async {
  final scannedItems = FFAppState().ScannedItems;
  final firestoreInstance = FirebaseFirestore.instance;

  var snapshot = await firestoreInstance.collection("products").doc(ean).get();

  if (!snapshot.exists) {
    return null;
  }

  if (updateFood != null && updateFood) {
    // get index of food in scanned items with right ean
    final foodIndex = scannedItems.indexWhere((food) => food.ean == ean);

    if (foodIndex != -1) {
      // update foods scannednumber and lasttimescanend
      FFAppState().updateScannedItemsAtIndex(
          foodIndex,
          (food) => ScannedItemStruct(
                ean: food.ean,
                numberOfScans: food.numberOfScans + 1,
                lastScanned: DateTime.now(),
                isFavourite: food.isFavourite,
              ));
    } else {
      FFAppState().addToScannedItems(ScannedItemStruct(
        ean: ean,
        numberOfScans: 1,
        lastScanned: DateTime.now(),
        isFavourite: false,
      ));
    }
  }

  // Add your function code here!
  return ProductsRecord.fromSnapshot(snapshot);
}
