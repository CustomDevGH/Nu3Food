// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class SafetyDot extends StatefulWidget {
  const SafetyDot({
    Key? key,
    this.width,
    this.height,
    required this.allergens,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<String> allergens;

  @override
  _SafetyDotState createState() => _SafetyDotState();
}

class _SafetyDotState extends State<SafetyDot> {
  Future<bool> getFoodSafety() async {
    final food = await isFoodSafe(widget.allergens);
    return food;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: getFoodSafety(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            width: 10.0,
            height: 10.0,
            decoration: BoxDecoration(
              color: Color(0x7a7a7a),
              shape: BoxShape.circle,
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Container(
            width: 10.0,
            height: 10.0,
            decoration: BoxDecoration(
              color:
                  snapshot.data == true ? Color(0xFF82D680) : Color(0xFFD68080),
              shape: BoxShape.circle,
            ),
          );
        }
      },
    );
  }
}
