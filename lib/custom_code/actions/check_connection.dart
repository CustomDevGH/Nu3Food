// Automatic FlutterFlow imports
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// my imports
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mongo_dart/mongo_dart.dart';

Future<bool> checkConnection() async {
  final connectivityResult = await (Connectivity().checkConnectivity());
  switch (connectivityResult) {
    case ConnectivityResult.mobile:
    case ConnectivityResult.wifi:
    case ConnectivityResult.vpn:
      // case ConnectivityResult.other for ios when on vpn but it could cause trouble because this state is ambigous
      // do something with this in main or something maybe set FFAppState()
      return true;
    default:
      return false;
  }
}

class DatabaseManager {
  static final DatabaseManager _instance = DatabaseManager._internal();
  late Db db;

  factory DatabaseManager() {
    return _instance;
  }

  DatabaseManager._internal() {
    // Initialize your database connection here
    db = Db(
        'mongodb://machineAdmin:Heslo12345678912.,@4.234.153.147:2004/off?authSource=admin');
  }

  Future<void> openConnection() async {
    if (!db.isConnected) {
      await db.open();
    }
  }

  Future<void> closeConnection() async {
    if (db.isConnected) {
      await db.close();
    }
  }
}
