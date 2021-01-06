import 'dart:async';
import 'package:topbar_app/common/dev_log.dart';
import 'package:topbar_app/common/key_generator.dart';
import 'package:topbar_app/data/user_dao.dart';
import 'package:topbar_app/model/user.dart';

class UserService {
  static UserService _sing = UserService._internal();
  static UserService sing() => _sing;
  UserService._internal();

  Future<List<User>> listAll() async {
    List<User> list = await UserDAO.sing().getAllUsers();
    //print('LIST $list');
    return list;
  }

  Future<String> login(String username, String password) async {
    String res = 'RES_NO_OK';
    List<User> users = await listAll();
    for (User user in users) {
      DevLog.sing().log('LOGINCHECK O${user.username}O O${user.password}O ');
      if (user.username == username && user.password == password) {
        res = 'RES_OK';
      }
    }
    return res;
  }

  Future<bool> isDefaultUser() async {
    bool res = false;
    List<User> users = await listAll();
    for (User user in users) {
      if (user.type == 'default') {
        res = true;
      }
    }
    return res;
  }

  Future<String> updateUser(User user) async {
    String res = 'RES_OK';
    if (user != null && user.username != null && user.password != null) {
      await UserDAO.sing().updateUser(user);
    } else {
      res = 'RES_NO_USER_OK';
    }
    return res;
  }

  Future<User> firstUser() async {
    User res;
    List<User> users = await listAll();
    res = users.first;
    return res;
  }

  Future<String> addUser(String username, String password) async {
    String res = 'RES_OK';
    List<User> users = await listAll();
    for (User user in users) {
      if (user.username == username) {
        res = 'RES_NO_OK';
      }
    }
    if (res == 'RES_OK') {
      String code;
      code = KeyGenerator.sing().generateKey();
      User u = User(username: username, password: password, code: code);
      await UserDAO.sing().addUser(u);
    }
    return res;
  }
}
