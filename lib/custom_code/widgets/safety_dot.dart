// Automatic FlutterFlow imports
// Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
// Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class SafetyDot extends StatefulWidget {
  const SafetyDot({
    super.key,
    this.width,
    this.height,
    required this.allergens,
  });

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
            decoration: const BoxDecoration(
              color: Color(0x007a7a7a),
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
                  snapshot.data == true ? const Color(0xFF82D680) : const Color(0xFFD68080),
              shape: BoxShape.circle,
            ),
          );
        }
      },
    );
  }
}
