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

class NamedSlider extends StatefulWidget {
  const NamedSlider({
    Key? key,
    this.width,
    this.height,
    required this.type,
    required this.minValue,
    required this.maxValue,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String type;
  final double minValue;
  final double maxValue;

  @override
  _NamedSliderState createState() => _NamedSliderState();
}

class _NamedSliderState extends State<NamedSlider> {
  double currentValue = 100;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 65,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.transparent,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${100.toString()} ${widget.type == 'Vaha' ? 'kg' : 'cm'}',
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "100",
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SliderTheme(
                data: SliderThemeData(
                  activeTrackColor: Color.fromRGBO(0, 0, 0, 1),
                  inactiveTrackColor: Color.fromRGBO(232, 232, 232, 1),
                  thumbColor: Color.fromRGBO(0, 0, 0, 1),
                  trackHeight: 2,
                  thumbShape:
                      const RoundSliderThumbShape(enabledThumbRadius: 8),
                  showValueIndicator: ShowValueIndicator.always,
                  valueIndicatorColor: Color.fromRGBO(0, 0, 0, 1),
                  valueIndicatorTextStyle: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Slider(
                  label: "100",
                  value: currentValue,
                  min: widget.minValue,
                  max: widget.maxValue,
                  onChanged: ((value) {
                    // update global state user and api call to save it
                    setState(() {
                      currentValue = value;
                    });
                  }),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
