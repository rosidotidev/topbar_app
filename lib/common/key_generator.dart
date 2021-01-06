import 'dart:math';

class KeyGenerator {
  static KeyGenerator _sing = KeyGenerator._internal();
  static KeyGenerator sing() => _sing;
  KeyGenerator._internal();
  String generateKey() {
    String res;
    var mill = DateTime.now().millisecondsSinceEpoch;
    res = '${mill}_' + getRandomString(6);
    return res;
  }

  final _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}
