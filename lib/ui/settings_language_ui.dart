import 'package:flutter/material.dart';
import 'package:topbar_app/bloc/lang_controller.dart';
import 'package:topbar_app/widget/rimage_menu_item.dart';
import 'package:get/get.dart';

class SettingsLanguageUI extends StatelessWidget {
  LangController ctrl = Get.put(LangController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.settings),
              iconSize: 30.0,
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Text('LANG1'.tr,
                style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ],
        ),
      ),
      body: Column(
        children: [
          Obx(() {
            Color bc = Colors.grey[200];
            if (ctrl.loacelVal.value == 'it_IT') {
              bc = Theme.of(context).primaryColorDark;
            }
            return RImageMenuItem(
                imageUrl: 'assets/it.jpg',
                title: 'Italian'.tr,
                borderColor: bc,
                onTap: () {
                  ctrl.chaneLang('it', 'IT');
                  //Get.updateLocale(Locale('it', 'IT'));
                });
          }),
          Obx(() {
            Color bc = Colors.grey[200];
            if (ctrl.loacelVal.value == 'en_US') {
              bc = Theme.of(context).primaryColorDark;
            }
            return RImageMenuItem(
                imageUrl: 'assets/uk.jpg',
                title: 'English'.tr,
                borderColor: bc,
                onTap: () {
                  ctrl.chaneLang('en', 'UK');
                  //Get.updateLocale(Locale('en', 'US'));
                });
          }),
        ],
      ),
    );
  }
}
