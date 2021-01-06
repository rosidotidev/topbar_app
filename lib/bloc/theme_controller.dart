import 'package:get/get.dart';
import 'package:topbar_app/bloc/user_service.dart';
import 'package:topbar_app/common/themes.dart';

class ThemeController extends GetxController {
  Future<void> changeTheme() async {
    UserService.sing().firstUser().then((user) {
      var vec = THM.keys.toList();
      var idx = vec.indexOf(user.theme);
      var length = vec.length;
      var newIdx = (idx + 1) % length;

      user.theme = vec[newIdx];
      Get.changeTheme(THM[vec[newIdx]]);
      UserService.sing().updateUser(user);
    });
  }
}
