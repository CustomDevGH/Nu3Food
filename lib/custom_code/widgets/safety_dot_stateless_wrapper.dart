// Automatic FlutterFlow imports
import 'index.dart'; // Imports other custom widgets
// Imports custom actions
// Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class SafetyDotStatelessWrapper extends StatelessWidget {
  const SafetyDotStatelessWrapper({
    super.key,
    this.width,
    this.height,
    required this.allergens,
  });

  final double? width;
  final double? height;
  final List<String> allergens;

  @override
  Widget build(BuildContext context) {
    return SafetyDot(width: width, height: height, allergens: allergens);
  }
}
