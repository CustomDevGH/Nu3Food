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
  set ScannedItems(List<ScannedItemStruct> _value) {
    _ScannedItems = _value;
    secureStorage.setStringList(
        'ff_ScannedItems', _value.map((x) => x.serialize()).toList());
  }

  void deleteScannedItems() {
    secureStorage.delete(key: 'ff_ScannedItems');
  }

  void addToScannedItems(ScannedItemStruct _value) {
    _ScannedItems.add(_value);
    secureStorage.setStringList(
        'ff_ScannedItems', _ScannedItems.map((x) => x.serialize()).toList());
  }

  void removeFromScannedItems(ScannedItemStruct _value) {
    _ScannedItems.remove(_value);
    secureStorage.setStringList(
        'ff_ScannedItems', _ScannedItems.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromScannedItems(int _index) {
    _ScannedItems.removeAt(_index);
    secureStorage.setStringList(
        'ff_ScannedItems', _ScannedItems.map((x) => x.serialize()).toList());
  }

  void updateScannedItemsAtIndex(
    int _index,
    ScannedItemStruct Function(ScannedItemStruct) updateFn,
  ) {
    _ScannedItems[_index] = updateFn(_ScannedItems[_index]);
    secureStorage.setStringList(
        'ff_ScannedItems', _ScannedItems.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInScannedItems(int _index, ScannedItemStruct _value) {
    _ScannedItems.insert(_index, _value);
    secureStorage.setStringList(
        'ff_ScannedItems', _ScannedItems.map((x) => x.serialize()).toList());
  }

  bool _IsGuest = true;
  bool get IsGuest => _IsGuest;
  set IsGuest(bool _value) {
    _IsGuest = _value;
    secureStorage.setBool('ff_IsGuest', _value);
  }

  void deleteIsGuest() {
    secureStorage.delete(key: 'ff_IsGuest');
  }

  List<String> _Allergies = [];
  List<String> get Allergies => _Allergies;
  set Allergies(List<String> _value) {
    _Allergies = _value;
    secureStorage.setStringList('ff_Allergies', _value);
  }

  void deleteAllergies() {
    secureStorage.delete(key: 'ff_Allergies');
  }

  void addToAllergies(String _value) {
    _Allergies.add(_value);
    secureStorage.setStringList('ff_Allergies', _Allergies);
  }

  void removeFromAllergies(String _value) {
    _Allergies.remove(_value);
    secureStorage.setStringList('ff_Allergies', _Allergies);
  }

  void removeAtIndexFromAllergies(int _index) {
    _Allergies.removeAt(_index);
    secureStorage.setStringList('ff_Allergies', _Allergies);
  }

  void updateAllergiesAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _Allergies[_index] = updateFn(_Allergies[_index]);
    secureStorage.setStringList('ff_Allergies', _Allergies);
  }

  void insertAtIndexInAllergies(int _index, String _value) {
    _Allergies.insert(_index, _value);
    secureStorage.setStringList('ff_Allergies', _Allergies);
  }

  DateTime? _dateOfBirdth;
  DateTime? get dateOfBirdth => _dateOfBirdth;
  set dateOfBirdth(DateTime? _value) {
    _dateOfBirdth = _value;
    _value != null
        ? secureStorage.setInt('ff_dateOfBirdth', _value.millisecondsSinceEpoch)
        : secureStorage.remove('ff_dateOfBirdth');
  }

  void deleteDateOfBirdth() {
    secureStorage.delete(key: 'ff_dateOfBirdth');
  }

  String _gender = '';
  String get gender => _gender;
  set gender(String _value) {
    _gender = _value;
    secureStorage.setString('ff_gender', _value);
  }

  void deleteGender() {
    secureStorage.delete(key: 'ff_gender');
  }

  bool _DoneWizzard = false;
  bool get DoneWizzard => _DoneWizzard;
  set DoneWizzard(bool _value) {
    _DoneWizzard = _value;
    secureStorage.setBool('ff_DoneWizzard', _value);
  }

  void deleteDoneWizzard() {
    secureStorage.delete(key: 'ff_DoneWizzard');
  }

  List<String> _Medication = [];
  List<String> get Medication => _Medication;
  set Medication(List<String> _value) {
    _Medication = _value;
    secureStorage.setStringList('ff_Medication', _value);
  }

  void deleteMedication() {
    secureStorage.delete(key: 'ff_Medication');
  }

  void addToMedication(String _value) {
    _Medication.add(_value);
    secureStorage.setStringList('ff_Medication', _Medication);
  }

  void removeFromMedication(String _value) {
    _Medication.remove(_value);
    secureStorage.setStringList('ff_Medication', _Medication);
  }

  void removeAtIndexFromMedication(int _index) {
    _Medication.removeAt(_index);
    secureStorage.setStringList('ff_Medication', _Medication);
  }

  void updateMedicationAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _Medication[_index] = updateFn(_Medication[_index]);
    secureStorage.setStringList('ff_Medication', _Medication);
  }

  void insertAtIndexInMedication(int _index, String _value) {
    _Medication.insert(_index, _value);
    secureStorage.setStringList('ff_Medication', _Medication);
  }

  String _imageName = 'avatar_111.svg';
  String get imageName => _imageName;
  set imageName(String _value) {
    _imageName = _value;
    secureStorage.setString('ff_imageName', _value);
  }

  void deleteImageName() {
    secureStorage.delete(key: 'ff_imageName');
  }

  bool _dobSet = false;
  bool get dobSet => _dobSet;
  set dobSet(bool _value) {
    _dobSet = _value;
    secureStorage.setBool('ff_dobSet', _value);
  }

  void deleteDobSet() {
    secureStorage.delete(key: 'ff_dobSet');
  }

  bool _medicaments = false;
  bool get medicaments => _medicaments;
  set medicaments(bool _value) {
    _medicaments = _value;
  }

  List<SynonymStruct> _listOfSynonyms = [];
  List<SynonymStruct> get listOfSynonyms => _listOfSynonyms;
  set listOfSynonyms(List<SynonymStruct> _value) {
    _listOfSynonyms = _value;
  }

  void addToListOfSynonyms(SynonymStruct _value) {
    _listOfSynonyms.add(_value);
  }

  void removeFromListOfSynonyms(SynonymStruct _value) {
    _listOfSynonyms.remove(_value);
  }

  void removeAtIndexFromListOfSynonyms(int _index) {
    _listOfSynonyms.removeAt(_index);
  }

  void updateListOfSynonymsAtIndex(
    int _index,
    SynonymStruct Function(SynonymStruct) updateFn,
  ) {
    _listOfSynonyms[_index] = updateFn(_listOfSynonyms[_index]);
  }

  void insertAtIndexInListOfSynonyms(int _index, SynonymStruct _value) {
    _listOfSynonyms.insert(_index, _value);
  }

  bool _isOcrEnabled = false;
  bool get isOcrEnabled => _isOcrEnabled;
  set isOcrEnabled(bool _value) {
    _isOcrEnabled = _value;
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
