// Automatic FlutterFlow imports
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';

Future<bool> isUserNew() async {
  final user = FirebaseAuth.instance.currentUser;
  // test whether user was created less than 1 minute ago
  return user != null &&
      user.metadata.creationTime != null &&
      user.metadata.creationTime!.isAfter(DateTime.now().subtract(
        const Duration(minutes: 1),
      ));
}
