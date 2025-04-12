import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'nutrition_table_row_model.dart';
export 'nutrition_table_row_model.dart';

class NutritionTableRowWidget extends StatefulWidget {
  const NutritionTableRowWidget({
    super.key,
    required this.nutrient,
  });

  final NutrientStruct? nutrient;

  @override
  State<NutritionTableRowWidget> createState() =>
      _NutritionTableRowWidgetState();
}

class _NutritionTableRowWidgetState extends State<NutritionTableRowWidget> {
  late NutritionTableRowModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NutritionTableRowModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.nutrient?.nutrientType}'.maybeHandleOverflow(
                    maxChars: 15,
                    replacement: '…',
                  ),
                  maxLines: 1,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Roboto',
                        color: const Color(0xFFAFACC7),
                        fontSize: 14.0,
                        letterSpacing: 0.25,
                        fontWeight: FontWeight.normal,
                        lineHeight: 1.65,
                      ),
                ),
                Text(
                  '${widget.nutrient?.value}${widget.nutrient?.unit}',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Roboto',
                        color: const Color(0xFFAFACC7),
                        fontSize: 14.0,
                        letterSpacing: 0.25,
                        fontWeight: FontWeight.normal,
                        lineHeight: 1.65,
                      ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 1.0,
              decoration: const BoxDecoration(
                color: Color(0xFFDEDEDE),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
