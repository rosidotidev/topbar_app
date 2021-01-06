import 'package:get/get.dart';
import '../bloc/account_controller.dart';
import '../bloc/increment_controller.dart';
import '../bloc/lang_controller.dart';

initAll() {
  Get.put(AccountController());
  Get.put(IncrementController());
  Get.put(LangController());
}
