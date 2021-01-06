import 'package:get/get.dart';
import 'package:topbar_app/bloc/user_service.dart';
import 'package:topbar_app/common/dev_log.dart';

class LoginController extends GetxController {
  var user = '';
  var passw = '';
  var isDefaultUser = false.obs;
  String autologin;
  String sUser = '';
  String sPsw = '';

  Future<String> login() async {
    //DevLog.sing().log(' login $user $passw');
    String res;
    var u = await UserService.sing().firstUser();
    this.autologin = u.autoLogin;
    DevLog.sing().log('>> LOGIN $autologin');
    if (autologin == 'Y') {
      res = 'RES_OK';
    } else {
      res = await UserService.sing().login(user, passw);
    }

    if (res == 'RES_OK') {
      user = '';
      passw = '';
    }

    return res;
  }

  @override
  void onInit() {
    UserService.sing().firstUser().then((res) {
      this.isDefaultUser.value = res.type == 'default';
      this.autologin =
          res.autoLogin == null || res.autoLogin == 'N' ? 'N' : 'Y';
      if (this.autologin == 'Y') {
        this.sUser = res.username;
        this.sPsw = res.password;
      }
    });
    super.onInit();
  }

  Future<void> evaluateDefaultUser() async {
    UserService.sing().firstUser().then((res) {
      this.isDefaultUser.value = res.type == 'default';
      this.autologin =
          res.autoLogin == null || res.autoLogin == 'N' ? 'N' : 'Y';
      if (this.autologin == 'Y') {
        this.sUser = res.username;
        this.sPsw = res.password;
      }
    });
  }
}
