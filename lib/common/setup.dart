import 'package:get/get.dart';
import '../bloc/account_controller.dart';
import '../bloc/increment_controller.dart';
import '../bloc/lang_controller.dart';
import '../bloc/login_controller.dart';
import '../bloc/theme_controller.dart';

initAll() {
  Get.put(LoginController());
  Get.put(AccountController());
  Get.put(ThemeController());
  Get.put(IncrementController());
  Get.put(LangController());
}
