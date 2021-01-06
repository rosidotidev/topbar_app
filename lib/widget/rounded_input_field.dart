import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final double width;
  String text;
  bool obfuscated;
  bool multiline;
  RoundedInputField(
      {Key key,
      this.obfuscated = false,
      this.hintText,
      this.multiline = false,
      this.text = '',
      this.icon = Icons.comment_rounded,
      this.onChanged,
      this.width = 0.8})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!this.multiline) {
      return _buildDefault(context);
    } else {
      return _buildMultiline(context);
    }
  }

  Widget _buildDefault(BuildContext context) {
    return TextField(
      //labelText: '';
      obscureText: obfuscated,
      onChanged: onChanged,
      controller: TextEditingController()..text = text,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 15.0),
        fillColor: Colors.white,
        filled: true,
        //hintText: hintText,
        labelText: hintText,
        prefixIcon: Icon(
          icon,
          size: 30.0,
        ),
      ),
    );
  }

  Widget _buildMultiline(BuildContext context) {
    return TextField(
      //labelText: '';
      keyboardType: TextInputType.multiline,
      minLines: 2,
      maxLines: null,
      obscureText: obfuscated,
      onChanged: onChanged,
      controller: TextEditingController()..text = text,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 15.0),
        fillColor: Colors.white,
        filled: true,
        //hintText: hintText,
        labelText: hintText,
        prefixIcon: Icon(
          icon,
          size: 30.0,
        ),
      ),
    );
  }
}
