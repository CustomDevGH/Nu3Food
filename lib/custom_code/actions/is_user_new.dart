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

import 'package:firebase_auth/firebase_auth.dart';

Future<bool> isUserNew() async {
  final user = FirebaseAuth.instance.currentUser;
  // test whether user was created less than 1 minute ago
  return user != null &&
      user.metadata.creationTime != null &&
      user.metadata.creationTime!.isAfter(DateTime.now().subtract(
        Duration(minutes: 1),
      ));
}
