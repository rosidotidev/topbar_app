class DevLog {
  static DevLog _sing = DevLog._internal();
  static DevLog sing() => _sing;

  DevLog._internal();

  void log(String msg) {
    print(msg);
  }
}
