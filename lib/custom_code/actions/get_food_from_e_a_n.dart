// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
// Imports other custom actions
// Imports custom functions
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
