import 'package:topbar_app/data/user_database.dart';
import 'package:topbar_app/model/user.dart';
import 'package:sembast/sembast.dart';
import 'test_data.dart';

class UserDAO {
  static UserDAO _sing = UserDAO._internal();
  static UserDAO sing() => _sing;
  UserDAO._internal();

  initDB() async {
    List<User> list = await this.getAllUsers();
    if (list.isEmpty) {
      list = users;
      for (User c in list) {
        await insertUser(c);
      }
    }
  }

  //static const String folderName = "categories";
  final StoreRef<int, Map<String, dynamic>> _userFolder =
      UserDatabase.instance.userFolder;

  Future<Database> get _db async => await UserDatabase.instance.database;

  Future insertUser(User user) async {
    await _userFolder.add(await _db, user.toJson());
  }

  Future updateUser(User user) async {
    final finder = Finder(filter: Filter.equals('code', user.code));
    await _userFolder.update(await _db, user.toJson(), finder: finder);
  }

  Future<List<User>> getAllUsers() async {
    final recordSnapshot = await _userFolder.find(await _db);
    return recordSnapshot.map((snapshot) {
      final user = User.fromJson(snapshot.value);
      return user;
    }).toList();
  }

  Future<User> addUser(User user) async {
    await _userFolder.add(await _db, user.toJson());

    return user;
  }
}
