// Automatic FlutterFlow imports
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// my imports
import 'package:flutter/foundation.dart' show kDebugMode;

Future setupApplication() async {
  if (kDebugMode) {
    //await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
  } else {}
  //FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
}
