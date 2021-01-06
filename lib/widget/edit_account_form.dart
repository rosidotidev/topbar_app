import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:topbar_app/bloc/account_controller.dart';
import 'package:topbar_app/common/dev_log.dart';
import 'package:topbar_app/widget/rounded_input_field.dart';
import 'package:topbar_app/widget/toast_x.dart';

class EditAccountForm extends StatelessWidget {
  EditAccountForm({
    Key key,
  }) : super(key: key);

  AccountController ctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Container(
          color: Theme.of(context).primaryColorLight,
          child: Padding(padding: EdgeInsets.all(4.0), child: Text(''))),
      SizedBox(height: 10),
      Obx(() => RoundedInputField(
            onChanged: (value) {
              ctrl.user = value;
            },
            icon: Icons.account_box,
            text: '${ctrl.usernameText.value}',
            hintText: 'Username'.tr,
            width: 0.8,
          )),
      SizedBox(height: 10),
      RoundedInputField(
        obfuscated: true,
        onChanged: (value) {
          ctrl.oldPassword = value;
        },
        icon: Icons.lock,
        text: '',
        hintText: 'Old password'.tr,
        width: 0.8,
      ),
      RoundedInputField(
        obfuscated: true,
        onChanged: (value) {
          ctrl.password = value;
        },
        icon: Icons.lock,
        text: '',
        hintText: 'New password'.tr,
        width: 0.8,
      ),
      RoundedInputField(
        obfuscated: true,
        onChanged: (value) {
          ctrl.confirmedPassword = value;
        },
        icon: Icons.lock,
        text: '',
        hintText: 'Confirm new password'.tr,
        width: 0.8,
      ),
      _switch(context),
      SizedBox(height: 80),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(width: 30),
          FloatingActionButton.extended(
              heroTag: "btn1",
              backgroundColor: Theme.of(context).primaryColor,
              label: Text('SAVE_A'.tr),
              icon: Icon(Icons.save),
              onPressed: () async {
                String res = await ctrl.evaluateAndSaveFormData();
                DevLog.sing().log(' save response: $res');
                if (res != 'RES_OK') {
                  ToastX.showSnackbarError('code $res'.tr, context);
                } else {
                  //Get.changeTheme(THM["BLACK1"]);
                  //Get.changeTheme(THM["BLACK1"]);
                  DevLog.sing().log(' going to came back');
                  Get.back();
                  ToastX.showSnackbarInfo(
                      'Your Account has been modified!!!'.tr, context);
                  //Get.back();
                }
              }),
          SizedBox(width: 30),
        ],
      )
    ]);
  }

  Widget _switch(BuildContext context) {
    return Obx(() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Switch(
                  activeColor: Theme.of(context).primaryColor,
                  value: ctrl.autologin.value,
                  onChanged: (b) {
                    ctrl.autologin.value = b;
                    ctrl.currentUser.autoLogin = b ? 'Y' : 'N';
                  }),
              Text('autologin_enabled'.tr),
            ],
          ),
          Container(
            height: 2,
            color: Theme.of(context).primaryColor,
          ),
        ],
      );
    });
  }
}
