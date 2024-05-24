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

// mine
import '../../components/medication_container/medication_container_widget.dart';

class MedicationDisplay extends StatefulWidget {
  const MedicationDisplay({
    Key? key,
    this.width,
    this.height,
    this.product,
  }) : super(key: key);

  final double? width;
  final double? height;
  final ProductsRecord? product;

  @override
  _MedicationDisplayState createState() => _MedicationDisplayState();
}

class _MedicationDisplayState extends State<MedicationDisplay> {
  Future<MedicationStruct> getMedicationStruct(String name) async {
    final fbInstance = FirebaseFirestore.instance;

    final medication = await fbInstance
        .collection('medication')
        .where("Name", isEqualTo: name)
        .get();

    if (medication.docs.length == 0) {
      return MedicationStruct(false, name);
    }

    final medicationItem = medication.docs[0];

    final classifications = medicationItem.get("Classification") as List;

    final classificationsKeys = <String>[];

    for (var item in classifications) {
      if (item is Map<String, dynamic>) {
        var map = Map<String, String>.from(item).values;
        classificationsKeys.addAll(map);
      } else {
        // throw FormatException(
        //     'Unexpected item format'); // or handle it in another way
      }
    }

    if (classificationsKeys.length == 0) {
      return MedicationStruct(false, name);
    }

    final fileteredClassificationKeys =
        getEveryOtherFromList(classificationsKeys, false);

    final businessRules = await fbInstance
        .collection('business_rules')
        .where("name", whereIn: fileteredClassificationKeys)
        .get();

    final allergens = widget.product!.allergens;

    final ingredients = widget.product!.ingredients;

    final nutritions = widget.product!.nutrients;

    for (var businessRule in businessRules.docs) {
      final booleanValues = businessRule.get("boolean_values");

      for (var allergen in allergens) {
        if (booleanValues.containsKey(allergen.toLowerCase()) &&
            booleanValues[allergen] == true) {
          return MedicationStruct(false, name);
        }
      }

      for (var ingredient in ingredients) {
        var ingredientName = ingredient.name.toLowerCase();
        if (booleanValues.containsKey(ingredientName) &&
            booleanValues[ingredientName] == true) {
          return MedicationStruct(false, name);
        }
      }

      final numericalValues = businessRule.get("numerical_values");

      for (var nutrition in nutritions) {
        final unit = nutrition.nutrientType.toLowerCase().replaceFirst(':', '');
        if (numericalValues.containsKey(unit) &&
            numericalValues[unit] <
                double.parse(nutrition.value.replaceAll(",", "."))) {
          return MedicationStruct(false, name);
        }
      }
    }

    return MedicationStruct(true, name);
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        final medication = FFAppState().Medication.toList();
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: List.generate(
              medication.length,
              (medicationIndex) {
                final medicationItem = medication[medicationIndex];
                var f = getMedicationStruct(medicationItem);
                return FutureBuilder(
                    future: f,
                    builder: (BuildContext context,
                        AsyncSnapshot<MedicationStruct> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting &&
                          mounted) {
                        return Container(
                          width: 30,
                          height: 25,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        );
                      }

                      if (snapshot.hasError && mounted) {
                        return Container(
                          width: 30,
                          height: 25,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.error,
                            color: Colors.white,
                          ),
                        );
                      }

                      if (!snapshot.hasData && mounted) {
                        return Container();
                      }

                      return MedicationContainerWidget(
                        key: Key(
                            'Keyylg_${medicationIndex}_of_${medication.length}'),
                        safe: snapshot.data!.safe,
                        name: snapshot.data!.name,
                      );
                    });
              },
            ).divide(SizedBox(width: 8.0)),
          ),
        );
      },
    );
  }
}

class MedicationStruct {
  bool safe;
  String name;

  MedicationStruct(this.safe, this.name);
}
