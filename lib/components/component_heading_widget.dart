import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'component_heading_model.dart';
export 'component_heading_model.dart';

class ComponentHeadingWidget extends StatefulWidget {
  const ComponentHeadingWidget({
    super.key,
    required this.title,
    required this.description,
    required this.spacing,
    required this.titleSize,
    required this.descriptionSize,
  });

  final String? title;
  final String? description;
  final int? spacing;
  final int? titleSize;
  final int? descriptionSize;

  @override
  State<ComponentHeadingWidget> createState() => _ComponentHeadingWidgetState();
}

class _ComponentHeadingWidgetState extends State<ComponentHeadingWidget> {
  late ComponentHeadingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComponentHeadingModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          widget.title!,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.of(context).primary,
                fontSize: widget.titleSize?.toDouble(),
                letterSpacing: 0.15,
                fontWeight: FontWeight.w800,
                lineHeight: 1.4,
              ),
        ),
        Text(
          widget.description!,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Roboto',
                color: const Color(0xFFAFACC7),
                fontSize: widget.descriptionSize?.toDouble(),
                letterSpacing: 0.0,
                lineHeight: 1.5,
              ),
        ),
      ].divide(SizedBox(height: widget.spacing!.toDouble())),
    );
  }
}
