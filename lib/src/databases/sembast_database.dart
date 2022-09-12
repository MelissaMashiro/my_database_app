import 'dart:async';
import 'dart:math';

import 'package:meli_flutter_app/src/models/user.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

const String usersFolderName = 'users';

class SembastDatabase {
  // A private constructor. Allows us to create instances of AppDatabase
  // only from within the AppDatabase class itself.
  SembastDatabase._();

// Singleton instance
  static final SembastDatabase _singleton = SembastDatabase._();

// Singleton accessor
  static SembastDatabase get instance => _singleton;

  // Completer is used for transforming synchronous code into asynchronous code.
  Completer<Database>? _dbOpenCompleter;

  // Database object accessor
  Future<Database> get database async {
    // If completer is null, AppDatabaseClass is newly instantiated, so database is not yet opened
    if (_dbOpenCompleter == null) {
      _dbOpenCompleter = Completer();
      // Calling _openDatabase will also complete the completer with database instance
      await _openDatabase();
    }
    // If the database is already opened, awaiting the future will happen instantly.
    // Otherwise, awaiting the returned future will take some time - until complete() is called
    // on the Completer in _openDatabase() below.
    return _dbOpenCompleter!.future;
  }

  Future _openDatabase() async {
    // Get a platform-specific directory where persistent app data can be stored
    final appDocumentDir = await getApplicationDocumentsDirectory();
    // Path with the form: /platform-specific-directory/demo.db
    final dbPath = join(appDocumentDir.path, 'sembastDB.db');

    final database = await databaseFactoryIo.openDatabase(dbPath);

    // Any code awaiting the Completer's future will now start executing
    _dbOpenCompleter!.complete(database);
  }

  final _usersFolder = intMapStoreFactory.store(usersFolderName);

  Future insertUser(User user) async {
    var _db = await SembastDatabase.instance.database;
    var random = Random();
    var min = 1;
    var max = 99;
    final idGenerated = min + random.nextInt(max - min);

    final newUser = User(
      id: idGenerated,
      name: user.name,
      lastname: user.lastname,
      age: user.age,
      email: user.email,
    );

    await _usersFolder.record(idGenerated).put(await _db, newUser.toJson());

    // await _usersFolder.add(await _db, newUser.toJson());
  }

  Future updateUser(User user) async {
    var _db = await SembastDatabase.instance.database;

    final finder = Finder(filter: Filter.byKey(user.id));
    await _usersFolder.update(
      await _db,
      user.toJson(),
      finder: finder,
    );
  }

  Future delete(dynamic userId) async {
    var _db = await SembastDatabase.instance.database;

    final finder = Finder(filter: Filter.byKey(userId));
    await _usersFolder.delete(
      await _db,
      finder: finder,
    );
  }

  Future<List<User>> getAllUsers() async {
    var _db = await SembastDatabase.instance.database;
    final recordSnapshot = await _usersFolder.find(await _db);
    return recordSnapshot.map((snapshot) {
      final user = User.fromJson(snapshot.value);
      return user;
    }).toList();
  }

  Future<User?> getSingleUser(dynamic userId) async {
    var _db = await SembastDatabase.instance.database;

    var userData = await _usersFolder.record(userId).get(await _db);

    if (userData != null) {
      return User.fromJson(userData);
    }
    return null;
  }
}
