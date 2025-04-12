// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
// Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
// Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

enum _Wrong { ALLERGEN, MEDS, NONE }

class ScannedItemSafetyText extends StatefulWidget {
  const ScannedItemSafetyText({
    super.key,
    this.width,
    this.height,
    this.ean,
    required this.allergens,
  });

  final double? width;
  final double? height;
  final List<String> allergens;
  final String? ean;

  @override
  _ScannedItemSafetyTextState createState() => _ScannedItemSafetyTextState();
}

class _ScannedItemSafetyTextState extends State<ScannedItemSafetyText> {
  Future<_Wrong> getFoodSafety() async {
    final allergic = await isFoodSafe(widget.allergens);
    if (!allergic) {
      return _Wrong.ALLERGEN;
    }

    if (widget.ean == null) return _Wrong.NONE;

    final food = await getFoodFromEAN(widget.ean!, false);

    if (food == null) {
      return _Wrong.NONE;
    }

    var meds = true;
    if (FFAppState().medicaments) {
      meds = await isDrugComplient(food);
    }

    if (!meds) {
      return _Wrong.MEDS;
    }
    return _Wrong.NONE;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getFoodSafety(),
      initialData: _Wrong.NONE,
      builder: (BuildContext context, AsyncSnapshot<_Wrong> snapshot) {
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
          String displayText = '';
          switch (snapshot.data!) {
            case _Wrong.ALLERGEN:
              displayText = FFLocalizations.of(context).languageCode == 'en'
                  ? 'Contains allergen'
                  : 'Obsahuje alergén';
              break;
            case _Wrong.MEDS:
              displayText = FFLocalizations.of(context).languageCode == 'en'
                  ? 'Not compatible with drugs'
                  : 'Nekompatibilné s liekmi';
              break;
            case _Wrong.NONE:
              displayText = FFLocalizations.of(context).languageCode == 'en'
                  ? 'Safe for you'
                  : 'Bezpečné pre Vás';
              break;
          }

          return Text(
            displayText,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Roboto',
                  color: snapshot.data! == _Wrong.NONE
                      ? FlutterFlowTheme.of(context).success
                      : FlutterFlowTheme.of(context).error,
                  letterSpacing: 0.15,
                  fontWeight: FontWeight.w800,
                ),
          );
        }
      },
    );
  }
}
