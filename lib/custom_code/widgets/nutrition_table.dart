// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
// Imports other custom widgets
// Imports custom actions
// Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class NutritionTable extends StatefulWidget {
  const NutritionTable({
    super.key,
    this.width,
    this.height,
    this.nutritions,
  });

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
      return const Text("No nutritions found");
    }

    return Table(
      columnWidths: const {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(1),
      },
      border: TableBorder.all(),
      children: [
        const TableRow(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Nutrition facts',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
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
              rows.add(
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, top: 8.0, bottom: 8.0),
                      child: Text(nutrition.subNutrition
                          .name), // The exclamation mark tells Dart that you know this value is not null
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          '${nutrition.subNutrition.value} ${nutrition.subNutrition.unit}'),
                    ),
                  ],
                ),
              );
            
              return rows;
            })
            .expand((x) => x)
            ,
      ],
    );
  }
}
