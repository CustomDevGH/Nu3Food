import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'medication_container_model.dart';
export 'medication_container_model.dart';

class MedicationContainerWidget extends StatefulWidget {
  const MedicationContainerWidget({
    super.key,
    required this.name,
    required this.safe,
  });

  final String? name;
  final bool? safe;

  @override
  State<MedicationContainerWidget> createState() =>
      _MedicationContainerWidgetState();
}

class _MedicationContainerWidgetState extends State<MedicationContainerWidget> {
  late MedicationContainerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MedicationContainerModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.safe!
            ? FlutterFlowTheme.of(context).success
            : FlutterFlowTheme.of(context).error,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8.0, 5.0, 8.0, 5.0),
        child: Text(
          widget.name!,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.roboto(
                  fontWeight: FontWeight.w800,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
                color: FlutterFlowTheme.of(context).primary,
                letterSpacing: 0.15,
                fontWeight: FontWeight.w800,
                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                lineHeight: 1.5,
              ),
        ),
      ),
    );
  }
}
