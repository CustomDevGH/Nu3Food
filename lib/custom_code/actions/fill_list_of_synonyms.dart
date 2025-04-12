// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future fillListOfSynonyms() async {
  // Add your function code here!
  var synonyms = await querySynonymsRecordOnce();
  var modifiedSynonyms = synonyms.map((e) {
    return SynonymStruct(name: e.reference.id, synonyms: e.synonyms);
  }).toList();

  FFAppState().listOfSynonyms = modifiedSynonyms;
}
