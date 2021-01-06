import 'package:flutter/material.dart';
import 'package:topbar_app/bloc/theme_controller.dart';
import 'package:topbar_app/common/dev_log.dart';
import 'package:topbar_app/ui/settings_account_ui.dart';
import 'package:topbar_app/ui/settings_language_ui.dart';
import 'package:topbar_app/widget/icon_menu_item.dart';
import 'package:get/get.dart';

class SettingsListUI extends StatelessWidget {
  ThemeController ctrl = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              iconSize: 30.0,
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Text('SETTINGS1'.tr,
                style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ],
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        IconMenuItem(
            icon: Icons.account_box,
            title: 'Account'.tr,
            row1: 'Change and manage password'.tr,
            onTap: () {
              DevLog.sing().log('msg');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SettingsAccountUI(),
                ),
              );
            }),
        IconMenuItem(
            icon: Icons.color_lens,
            title: 'Theme'.tr,
            row1: 'Change color and skin'.tr,
            onTap: () {
              ctrl.changeTheme();
            }),
        IconMenuItem(
            icon: Icons.photo,
            title: 'Language'.tr,
            row1: 'Change and manage language'.tr,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SettingsLanguageUI(),
                ),
              );
            }),
      ]),
    );
  }
}
