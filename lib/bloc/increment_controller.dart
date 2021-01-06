import 'package:get/get.dart';

class IncrementController extends GetxController {
  var currValue = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> inc() async {
    currValue.value = currValue.value + 1;
  }
}
