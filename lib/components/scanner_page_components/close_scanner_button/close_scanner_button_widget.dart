import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'close_scanner_button_model.dart';
export 'close_scanner_button_model.dart';

class CloseScannerButtonWidget extends StatefulWidget {
  const CloseScannerButtonWidget({super.key});

  @override
  State<CloseScannerButtonWidget> createState() =>
      _CloseScannerButtonWidgetState();
}

class _CloseScannerButtonWidgetState extends State<CloseScannerButtonWidget> {
  late CloseScannerButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CloseScannerButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        logFirebaseEvent('CLOSE_SCANNER_BUTTON_Container_t9ch52nb_');
        context.safePop();
      },
      child: Container(
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
          color: Color(0xFFB7C1FA),
          shape: BoxShape.circle,
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: SvgPicture.asset(
              'assets/images/cross.svg',
              width: 22.0,
              height: 22.0,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
