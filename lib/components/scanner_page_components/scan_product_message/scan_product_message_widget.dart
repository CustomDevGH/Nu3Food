import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'scan_product_message_model.dart';
export 'scan_product_message_model.dart';

class ScanProductMessageWidget extends StatefulWidget {
  const ScanProductMessageWidget({super.key});

  @override
  State<ScanProductMessageWidget> createState() =>
      _ScanProductMessageWidgetState();
}

class _ScanProductMessageWidgetState extends State<ScanProductMessageWidget> {
  late ScanProductMessageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScanProductMessageModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(24.0, 70.0, 24.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: AutoSizeText(
          FFLocalizations.of(context).getText(
            'cz2154o8' /* Scan product */,
          ),
          maxLines: 1,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Roboto',
                color: Color(0xFFD7D5E3),
                fontSize: 32.0,
                letterSpacing: 0.25,
                fontWeight: FontWeight.w800,
                lineHeight: 1.3,
              ),
        ),
      ),
    );
  }
}
