// Automatic FlutterFlow imports
// Imports other custom widgets
// Imports custom actions
// Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_svg/svg.dart';

class ImageFromString extends StatefulWidget {
  const ImageFromString({
    super.key,
    this.width,
    this.height,
    required this.name,
    required this.isInternet,
  });

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
          'assets/images/${widget.name}',
          width: widget.width,
          height: widget.height,
          fit: BoxFit.scaleDown,
        );
      } else {
        return Image.asset(
          'assets/images/${widget.name}',
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
