import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'add_new_ean_request_model.dart';
export 'add_new_ean_request_model.dart';

class AddNewEanRequestWidget extends StatefulWidget {
  const AddNewEanRequestWidget({super.key});

  @override
  State<AddNewEanRequestWidget> createState() => _AddNewEanRequestWidgetState();
}

class _AddNewEanRequestWidgetState extends State<AddNewEanRequestWidget> {
  late AddNewEanRequestModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddNewEanRequestModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(
        color: Color(0xFFB7C1FA),
        shape: BoxShape.circle,
      ),
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: SvgPicture.asset(
            'assets/images/Light.svg',
            width: 34.0,
            height: 34.0,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
