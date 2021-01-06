import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:topbar_app/bloc/login_controller.dart';
import 'package:topbar_app/widget/toast_x.dart';
import 'home_ui.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  HomeUI homeUI;
  final LoginController ctrl = Get.put(LoginController());

  LoginScreen({Key key}) : super(key: key);

  Widget _showAdvice(BuildContext context) {
    Widget w;

    if (ctrl.isDefaultUser.value) {
      w = Expanded(
        child: Align(
          alignment: FractionalOffset.bottomCenter,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              color: Theme.of(context).primaryColor,
              height: 80.0,
              child: Text(
                'Enter with admin/admin (change it) ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      w = Text('');
    }

    return w;
  }

  _login(BuildContext context) async {
    //DevLog.sing().log(' _login ${ctrl.user} ${ctrl.passw} ');
    if (homeUI == null) {
      homeUI = HomeUI(title: 'Memo Block');
    }
    String res;
    //res = await LoginBloc.sing().login();
    res = await ctrl.login();
    if (res == 'RES_OK') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) {
          return homeUI;
        } //=> HomeScreen(),
            ),
      );
    } else {
      ToastX.showSnackbarError('Invalid Username or Password'.tr, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Image.asset(
                'assets/topbar_app_logo.jpg',
                height: 150,
              ),
              Text(
                'Topbar App',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 5.0,
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: TextField(
                  //controller: TextEditingController()..text = ctrl.showUSR(),
                  onChanged: (String usr) {
                    //LoginBloc.sing().user = usr;
                    ctrl.user = usr;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Username'.tr,
                    prefixIcon: Icon(
                      Icons.account_box,
                      size: 30.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: TextField(
                  //controller: TextEditingController()..text = ctrl.showPSW(),
                  onChanged: (String pasw) {
                    //LoginBloc.sing().passw = pasw;
                    //DevLog.sing().log(' A psasw $pasw');
                    ctrl.passw = pasw;
                    //DevLog.sing().log(' B psasw ${ctrl.user} ${ctrl.passw}');
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Password',
                    prefixIcon: Icon(
                      Icons.lock,
                      size: 30.0,
                    ),
                  ),
                  obscureText: true,
                ),
              ),
              SizedBox(height: 40.0),
              GestureDetector(
                onTap: () async {
                  await _login(context);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 60.0),
                  alignment: Alignment.center,
                  height: 45.0,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    'LOGIN'.tr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ),
              Obx(() => _showAdvice(context)),
            ],
          ),
        ),
      ),
    );
  }
}
