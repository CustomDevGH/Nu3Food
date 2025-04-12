import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'add_manually_button_model.dart';
export 'add_manually_button_model.dart';

class AddManuallyButtonWidget extends StatefulWidget {
  const AddManuallyButtonWidget({
    super.key,
    required this.ean,
    required this.onPressed,
  });

  final String? ean;
  final Future Function()? onPressed;

  @override
  State<AddManuallyButtonWidget> createState() =>
      _AddManuallyButtonWidgetState();
}

class _AddManuallyButtonWidgetState extends State<AddManuallyButtonWidget> {
  late AddManuallyButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddManuallyButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        logFirebaseEvent('ADD_MANUALLY_BUTTON_Container_1zy5gdz1_O');

        await RequestedEansRecord.collection
            .doc()
            .set(createRequestedEansRecordData(
              ean: widget.ean,
              createdBy: FFAppState().IsGuest ? 'guest' : currentUserUid,
              creationTime: getCurrentTimestamp,
            ));
        await widget.onPressed?.call();
      },
      child: Container(
        width: 160.0,
        height: 60.0,
        decoration: BoxDecoration(
          color: const Color(0xFFB7C1FA),
          borderRadius: BorderRadius.circular(76.0),
        ),
        child: Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Text(
            FFLocalizations.of(context).getText(
              '7dl2baci' /* Add manually */,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.of(context).primary,
                  fontSize: 18.0,
                  letterSpacing: 0.15,
                  fontWeight: FontWeight.w800,
                ),
          ),
        ),
      ),
    );
  }
}
