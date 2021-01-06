import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:topbar_app/model/user.dart';
import 'package:topbar_app/ui/login_screen.dart';
import 'bloc/user_service.dart';
import 'common/dev_log.dart';
import 'common/i18n_text.dart';
import 'common/themes.dart';
import 'common/setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  User us = await UserService.sing().firstUser();
  initAll();
  runApp(TopbarApp(us));
}

class TopbarApp extends StatelessWidget {
  final User user;
  TopbarApp(this.user);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    DevLog.sing().log('USER_THEME ${user.theme}');

    return GetMaterialApp(
      translations: I18NText(), // your translations
      //locale: Locale('it', 'IT'),
      locale: _locale(user.locale),
      title: 'Topbar App',
      debugShowCheckedModeBanner: false,
      theme: THM[user.theme],
      home: LoginScreen(),
    );
  }

  Locale _locale(String locale) {
    Locale res;
    var loc = locale.split('_');
    res = Locale(loc[0], loc[1]);
    return res;
  }
}
