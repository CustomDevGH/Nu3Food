import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ocr_scanner_page_model.dart';
export 'ocr_scanner_page_model.dart';

class OcrScannerPageWidget extends StatefulWidget {
  const OcrScannerPageWidget({super.key});

  @override
  State<OcrScannerPageWidget> createState() => _OcrScannerPageWidgetState();
}

class _OcrScannerPageWidgetState extends State<OcrScannerPageWidget> {
  late OcrScannerPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OcrScannerPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'OcrScannerPage'});
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
        backgroundColor: Colors.transparent,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: custom_widgets.OCRScanning(
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }
}
