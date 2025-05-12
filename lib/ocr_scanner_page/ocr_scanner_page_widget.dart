import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'ocr_scanner_page_model.dart';
export 'ocr_scanner_page_model.dart';

class OcrScannerPageWidget extends StatefulWidget {
  const OcrScannerPageWidget({super.key});

  static String routeName = 'OcrScannerPage';
  static String routePath = '/ocrScannerPage';

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
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
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
