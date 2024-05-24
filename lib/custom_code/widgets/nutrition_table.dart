// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class NutritionTable extends StatefulWidget {
  const NutritionTable({
    Key? key,
    this.width,
    this.height,
    this.nutritions,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<NutritionStruct>? nutritions;

  @override
  _NutritionTableState createState() => _NutritionTableState();
}

class _NutritionTableState extends State<NutritionTable> {
  @override
  Widget build(BuildContext context) {
    if (widget.nutritions == null) {
      return Text("No nutritions found");
    }

    return Table(
      columnWidths: {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(1),
      },
      border: TableBorder.all(),
      children: [
        TableRow(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Nutrition facts',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'As sold for 100 g /',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '100 ml',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
        ...widget.nutritions!
            .map((nutrition) {
              List<TableRow> rows = [];

              // Parent row
              rows.add(
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(nutrition.name),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${nutrition.value} ${nutrition.units}'),
                    ),
                  ],
                ),
              );

              // SubNutrition row (only if subNutrition is not null)
              if (nutrition.subNutrition != null) {
                rows.add(
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, top: 8.0, bottom: 8.0),
                        child: Text(nutrition.subNutrition!
                            .name), // The exclamation mark tells Dart that you know this value is not null
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            '${nutrition.subNutrition!.value} ${nutrition.subNutrition!.unit}'),
                      ),
                    ],
                  ),
                );
              }

              return rows;
            })
            .expand((x) => x)
            .toList(),
      ],
    );
  }
}
