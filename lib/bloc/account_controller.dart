import 'package:get/get.dart';
import 'package:topbar_app/bloc/user_service.dart';
import 'package:topbar_app/model/user.dart';

class AccountController extends GetxController {
  var user = '';
  var password = '';
  var confirmedPassword = '';
  var oldPassword = '';
  var isDefaultUser = false.obs;
  var usernameText = ''.obs;
  var autologin = false.obs;
  User currentUser;

  @override
  void onInit() {
    // called immediately after the widget is allocated memory
    UserService.sing().listAll().then((value) {
      this.currentUser = value.first;
      this.usernameText.value = this.currentUser.username;
      this.autologin.value = 'Y' == this.currentUser.autoLogin;
      this.user = this.currentUser.username;
    });
    super.onInit();
  }

  Future<void> evaluateDefaultUser() async {
    UserService.sing().isDefaultUser().then((res) {
      this.isDefaultUser.value = res;
    });
  }

  String _evaluateUserFormData() {
    String res = 'RES_OK';
    if (user == '') {
      res = 'NO_OK_USER';
    }
    return res;
  }

  String _evaluateOldPSWFormData() {
    String res = 'RES_OK';

    if (oldPassword == '' || oldPassword != currentUser.password) {
      res = 'NO_OK_OLD_PSW';
    }
    return res;
  }

  String _evaluatePSWFormData() {
    String res = 'RES_OK';
    if (password == '') {
      res = 'NO_OK_PSW';
    } else if (confirmedPassword == '') {
      res = 'NO_OK_CONF_PSW';
    } else if (confirmedPassword != password) {
      res = 'NO_OK_SAME_PSW';
    }
    if (confirmedPassword == '' && password == '') {
      res = 'RES_OK_EMPTY';
    }
    return res;
  }

  String _eval(List<Function> check) {
    String res = 'RES_OK';
    int i = 0;
    while (res == 'RES_OK' && i < check.length) {
      res = check[i].call();
      i++;
    }
    return res;
  }

  Future<String> evaluateAndSaveFormData() async {
    String res = 'RES_OK';

    List<Function> chain = [];
    chain
      ..add(_evaluateUserFormData)
      ..add(_evaluateOldPSWFormData)
      ..add(_evaluatePSWFormData);
    res = _eval(chain);
    if (res == 'RES_OK' || res == 'RES_OK_EMPTY') {
      currentUser.username = user;
      if ('RES_OK' == res) {
        currentUser.password = password;
      }
      currentUser.type = 'no_default';
      res = await UserService.sing().updateUser(currentUser);
      usernameText.value = user;
      password = '';
      confirmedPassword = '';
      oldPassword = '';
      res = 'RES_OK';
    }
    return res;
  }
}
