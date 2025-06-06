
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

String? ingredientsToString(List<IngredientStruct>? ingredients) {
  if (ingredients == null) {
    return null;
  }
  return ingredients
      .map(
        (e) => e.name,
      )
      .join(", ");
}

bool listContainsItem(
  String allergen,
  List<String> allergies,
) {
  return allergies.map((e) => e.toLowerCase()).contains(allergen.toLowerCase());
}

List<String> getEveryOtherFromList(
  List<String> list,
  bool odd,
) {
  // get every odd item from list and then retur the list
  List<String> result = [];
  for (int i = odd ? 1 : 0; i < list.length; i += 2) {
    result.add(list[i]);
  }
  return result;
}

List<String> getListOfAvatars(String? photo) {
  List<String> result = [];

  if (photo != null) {
    // Add user's profile picture to list
    result.add(photo);
  }

  for (int i = 111; i <= 119; i++) {
    result.add("avatar_$i.svg");
  }

  return result;
}

String getNovaGroupMarkersString(List<NovaGroupMarkerStruct> markers) {
  var res = "";
  var marker = markers.firstOrNull;

  if (marker == null) {
    res = "No data";
    return res;
  }

  res += "Category ${marker.id} -> \n";
  for (var value in marker.values) {
    res += "\t${value.name}: ";
    res += value.values
        .map((e) {
          return "$e ";
        })
        .toString()
        .trim();
    res += "\n";
  }

  return res;
}
