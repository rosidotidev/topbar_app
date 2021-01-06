import 'dart:async';

import 'package:topbar_app/data/test_data.dart';
import 'package:topbar_app/model/user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path/path.dart';

class UserDatabase {
  static bool cleanDB = true;
  static final UserDatabase _singleton = UserDatabase._();

  static UserDatabase get instance => _singleton;

  // Completer is used for transforming synchronous code into asynchronous code.
  Completer<Database> _dbOpenCompleter;

  // A private constructor. Allows us to create instances of AppDatabase
  // only from within the AppDatabase class itself.
  UserDatabase._();
  static const String folderName = "user";
  final userFolder = intMapStoreFactory.store(folderName);
  // Database object accessor
  Future<Database> get database async {
    // If completer is null, AppDatabaseClass is newly instantiated, so database is not yet opened
    if (_dbOpenCompleter == null) {
      _dbOpenCompleter = Completer();
      // Calling _openDatabase will also complete the completer with database instance
      _openDatabase();
    }

    return _dbOpenCompleter.future;
  }

  Future _openDatabase() async {
    // Get a platform-specific directory where persistent app data can be stored
    final appDocumentDir = await getApplicationDocumentsDirectory();
    // Path with the form: /platform-specific-directory/demo.db
    final dbPath = join(appDocumentDir.path, 'userstore_04.db');
    //final dbPath = join('./tmp/', 'CategoriesDB.db');

    final database = await databaseFactoryIo.openDatabase(dbPath, version: 1,
        onVersionChanged: (db, oldVersion, newVersion) async {
      print('------------------USER INIT DATABASE -------');
      if (oldVersion == 0 || cleanDB) {
        print('------------------USER REFRESH DATABASE -------');
        await userFolder.delete(db);
        for (User user in users) {
          await userFolder.add(db, user.toJson());
        }
      }
    });

    // Any code awaiting the Completer's future will now start executing
    _dbOpenCompleter.complete(database);
  }
}
