import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ocr_date_wizzard_model.dart';
export 'ocr_date_wizzard_model.dart';

class OcrDateWizzardWidget extends StatefulWidget {
  const OcrDateWizzardWidget({
    super.key,
    this.ean,
  });

  final String? ean;

  @override
  State<OcrDateWizzardWidget> createState() => _OcrDateWizzardWidgetState();
}

class _OcrDateWizzardWidgetState extends State<OcrDateWizzardWidget> {
  late OcrDateWizzardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OcrDateWizzardModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'OcrDateWizzard'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: custom_widgets.CameraForWizzard(
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}
