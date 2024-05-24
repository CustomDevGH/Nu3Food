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

import 'package:flutter_svg/svg.dart';

class ImageFromString extends StatefulWidget {
  const ImageFromString({
    Key? key,
    this.width,
    this.height,
    required this.name,
    required this.isInternet,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String name;
  final bool isInternet;

  @override
  _ImageFromStringState createState() => _ImageFromStringState();
}

class _ImageFromStringState extends State<ImageFromString> {
  @override
  Widget build(BuildContext context) {
    if (!widget.isInternet) {
      if (widget.name.endsWith("svg")) {
        return SvgPicture.asset(
          'assets/images/' + widget.name,
          width: widget.width,
          height: widget.height,
          fit: BoxFit.scaleDown,
        );
      } else {
        return Image.asset(
          'assets/images/' + widget.name,
          width: widget.width,
          height: widget.height,
          fit: BoxFit.scaleDown,
        );
      }
    } else {
      return Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(widget.name),
            fit: BoxFit.scaleDown,
          ),
          shape: BoxShape.circle,
        ),
      );
    }
  }
}
