import 'package:flutter/material.dart';
import 'package:topbar_app/widget/edit_account_form.dart';
import 'package:get/get.dart';

class SettingsAccountUI extends StatelessWidget {
  @override
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
            Text('  Account '.tr,
                style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ],
        ),
      ),
      body: SingleChildScrollView(child: EditAccountForm()),
    );
  }
}
