import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'camera_widget.dart' show CameraWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CameraModel extends FlutterFlowModel<CameraWidget> {
  ///  Local state fields for this page.

  bool? foundEAN = false;

  bool shouldScan = true;

  String? ean;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
