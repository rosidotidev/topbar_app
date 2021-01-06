import 'package:flutter/material.dart';
import 'package:topbar_app/bloc/increment_controller.dart';
import 'package:topbar_app/common/dev_log.dart';
import 'package:topbar_app/ui/settings_list_ui.dart';
import 'package:topbar_app/widget/push_label_icon.dart';
import 'login_screen.dart';
import 'package:get/get.dart';

class HomeUI extends StatelessWidget {
  HomeUI({Key key, this.title}) : super(key: key);
  final String title;

  IncrementController ctrl = Get.find();

  _buildHeaderX(BuildContext context) {
    DevLog.sing().log(' _buildHeaderX');
    var h1 = AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          PushLabelIcon(
              text: 'Settings'.tr,
              icon: Icons.settings,
              onTap: () {
                //print('onTap');
                _navigateToSettingsUI(context);
              }),
          PushLabelIcon(
              text: 'Exit'.tr,
              icon: Icons.logout,
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) {
                    return LoginScreen();
                  }),
                );
              })
        ],
      ),
    );
    return h1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildHeaderX(context),
      body: Obx(() {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                '${ctrl.currValue.value}',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 5.0,
                ),
              ),
            ],
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ctrl.inc();
        },
        tooltip: '',
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _navigateToSettingsUI(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SettingsListUI(),
      ),
    );
  }
}
