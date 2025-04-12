import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _ScannedItems = (await secureStorage.getStringList('ff_ScannedItems'))
              ?.map((x) {
                try {
                  return ScannedItemStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _ScannedItems;
    });
    await _safeInitAsync(() async {
      _IsGuest = await secureStorage.getBool('ff_IsGuest') ?? _IsGuest;
    });
    await _safeInitAsync(() async {
      _Allergies =
          await secureStorage.getStringList('ff_Allergies') ?? _Allergies;
    });
    await _safeInitAsync(() async {
      _dateOfBirdth = await secureStorage.read(key: 'ff_dateOfBirdth') != null
          ? DateTime.fromMillisecondsSinceEpoch(
              (await secureStorage.getInt('ff_dateOfBirdth'))!)
          : _dateOfBirdth;
    });
    await _safeInitAsync(() async {
      _gender = await secureStorage.getString('ff_gender') ?? _gender;
    });
    await _safeInitAsync(() async {
      _DoneWizzard =
          await secureStorage.getBool('ff_DoneWizzard') ?? _DoneWizzard;
    });
    await _safeInitAsync(() async {
      _Medication =
          await secureStorage.getStringList('ff_Medication') ?? _Medication;
    });
    await _safeInitAsync(() async {
      _imageName = await secureStorage.getString('ff_imageName') ?? _imageName;
    });
    await _safeInitAsync(() async {
      _dobSet = await secureStorage.getBool('ff_dobSet') ?? _dobSet;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  List<ScannedItemStruct> _ScannedItems = [];
  List<ScannedItemStruct> get ScannedItems => _ScannedItems;
  set ScannedItems(List<ScannedItemStruct> value) {
    _ScannedItems = value;
    secureStorage.setStringList(
        'ff_ScannedItems', value.map((x) => x.serialize()).toList());
  }

  void deleteScannedItems() {
    secureStorage.delete(key: 'ff_ScannedItems');
  }

  void addToScannedItems(ScannedItemStruct value) {
    ScannedItems.add(value);
    secureStorage.setStringList(
        'ff_ScannedItems', _ScannedItems.map((x) => x.serialize()).toList());
  }

  void removeFromScannedItems(ScannedItemStruct value) {
    ScannedItems.remove(value);
    secureStorage.setStringList(
        'ff_ScannedItems', _ScannedItems.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromScannedItems(int index) {
    ScannedItems.removeAt(index);
    secureStorage.setStringList(
        'ff_ScannedItems', _ScannedItems.map((x) => x.serialize()).toList());
  }

  void updateScannedItemsAtIndex(
    int index,
    ScannedItemStruct Function(ScannedItemStruct) updateFn,
  ) {
    ScannedItems[index] = updateFn(_ScannedItems[index]);
    secureStorage.setStringList(
        'ff_ScannedItems', _ScannedItems.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInScannedItems(int index, ScannedItemStruct value) {
    ScannedItems.insert(index, value);
    secureStorage.setStringList(
        'ff_ScannedItems', _ScannedItems.map((x) => x.serialize()).toList());
  }

  bool _IsGuest = true;
  bool get IsGuest => _IsGuest;
  set IsGuest(bool value) {
    _IsGuest = value;
    secureStorage.setBool('ff_IsGuest', value);
  }

  void deleteIsGuest() {
    secureStorage.delete(key: 'ff_IsGuest');
  }

  List<String> _Allergies = [];
  List<String> get Allergies => _Allergies;
  set Allergies(List<String> value) {
    _Allergies = value;
    secureStorage.setStringList('ff_Allergies', value);
  }

  void deleteAllergies() {
    secureStorage.delete(key: 'ff_Allergies');
  }

  void addToAllergies(String value) {
    Allergies.add(value);
    secureStorage.setStringList('ff_Allergies', _Allergies);
  }

  void removeFromAllergies(String value) {
    Allergies.remove(value);
    secureStorage.setStringList('ff_Allergies', _Allergies);
  }

  void removeAtIndexFromAllergies(int index) {
    Allergies.removeAt(index);
    secureStorage.setStringList('ff_Allergies', _Allergies);
  }

  void updateAllergiesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    Allergies[index] = updateFn(_Allergies[index]);
    secureStorage.setStringList('ff_Allergies', _Allergies);
  }

  void insertAtIndexInAllergies(int index, String value) {
    Allergies.insert(index, value);
    secureStorage.setStringList('ff_Allergies', _Allergies);
  }

  DateTime? _dateOfBirdth;
  DateTime? get dateOfBirdth => _dateOfBirdth;
  set dateOfBirdth(DateTime? value) {
    _dateOfBirdth = value;
    value != null
        ? secureStorage.setInt('ff_dateOfBirdth', value.millisecondsSinceEpoch)
        : secureStorage.remove('ff_dateOfBirdth');
  }

  void deleteDateOfBirdth() {
    secureStorage.delete(key: 'ff_dateOfBirdth');
  }

  String _gender = '';
  String get gender => _gender;
  set gender(String value) {
    _gender = value;
    secureStorage.setString('ff_gender', value);
  }

  void deleteGender() {
    secureStorage.delete(key: 'ff_gender');
  }

  bool _DoneWizzard = false;
  bool get DoneWizzard => _DoneWizzard;
  set DoneWizzard(bool value) {
    _DoneWizzard = value;
    secureStorage.setBool('ff_DoneWizzard', value);
  }

  void deleteDoneWizzard() {
    secureStorage.delete(key: 'ff_DoneWizzard');
  }

  List<String> _Medication = [];
  List<String> get Medication => _Medication;
  set Medication(List<String> value) {
    _Medication = value;
    secureStorage.setStringList('ff_Medication', value);
  }

  void deleteMedication() {
    secureStorage.delete(key: 'ff_Medication');
  }

  void addToMedication(String value) {
    Medication.add(value);
    secureStorage.setStringList('ff_Medication', _Medication);
  }

  void removeFromMedication(String value) {
    Medication.remove(value);
    secureStorage.setStringList('ff_Medication', _Medication);
  }

  void removeAtIndexFromMedication(int index) {
    Medication.removeAt(index);
    secureStorage.setStringList('ff_Medication', _Medication);
  }

  void updateMedicationAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    Medication[index] = updateFn(_Medication[index]);
    secureStorage.setStringList('ff_Medication', _Medication);
  }

  void insertAtIndexInMedication(int index, String value) {
    Medication.insert(index, value);
    secureStorage.setStringList('ff_Medication', _Medication);
  }

  String _imageName = 'avatar_111.svg';
  String get imageName => _imageName;
  set imageName(String value) {
    _imageName = value;
    secureStorage.setString('ff_imageName', value);
  }

  void deleteImageName() {
    secureStorage.delete(key: 'ff_imageName');
  }

  bool _dobSet = false;
  bool get dobSet => _dobSet;
  set dobSet(bool value) {
    _dobSet = value;
    secureStorage.setBool('ff_dobSet', value);
  }

  void deleteDobSet() {
    secureStorage.delete(key: 'ff_dobSet');
  }

  bool _medicaments = false;
  bool get medicaments => _medicaments;
  set medicaments(bool value) {
    _medicaments = value;
  }

  List<SynonymStruct> _listOfSynonyms = [];
  List<SynonymStruct> get listOfSynonyms => _listOfSynonyms;
  set listOfSynonyms(List<SynonymStruct> value) {
    _listOfSynonyms = value;
  }

  void addToListOfSynonyms(SynonymStruct value) {
    listOfSynonyms.add(value);
  }

  void removeFromListOfSynonyms(SynonymStruct value) {
    listOfSynonyms.remove(value);
  }

  void removeAtIndexFromListOfSynonyms(int index) {
    listOfSynonyms.removeAt(index);
  }

  void updateListOfSynonymsAtIndex(
    int index,
    SynonymStruct Function(SynonymStruct) updateFn,
  ) {
    listOfSynonyms[index] = updateFn(_listOfSynonyms[index]);
  }

  void insertAtIndexInListOfSynonyms(int index, SynonymStruct value) {
    listOfSynonyms.insert(index, value);
  }

  bool _isOcrEnabled = false;
  bool get isOcrEnabled => _isOcrEnabled;
  set isOcrEnabled(bool value) {
    _isOcrEnabled = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
