class User {
  String username;
  String password;
  String code;
  String type = "default";
  String locale = 'en_UK';
  String theme = "BASE";
  String autoLogin = "N";

  User(
      {this.username,
      this.password,
      this.code,
      this.autoLogin = 'N',
      this.type,
      this.locale = 'en_UK',
      this.theme = "BASE"});

  factory User.fromJson(Map<String, dynamic> json) {
    User m = User(
        username: json["username"],
        password: json["password"],
        code: json["code"],
        type: json["type"],
        locale: json["locale"],
        autoLogin:
            json["autoLogin"] == null || json["autoLogin"] == 'N' ? 'N' : 'Y',
        theme: json["theme"]);
    return m;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> m = {
      "username": username,
      "password": password,
      "code": code,
      "type": type,
      "theme": theme,
      "autoLogin": autoLogin.isEmpty || autoLogin == 'N' ? 'N' : 'Y',
      "locale": locale
    };
    return m;
  }

  @override
  int get hashCode {
    int hc = this.code.length + this.username.hashCode;
    return hc;
  }

  @override
  bool operator ==(other) {
    if (other is! User) {
      return false;
    }
    return code + username == (other as User).code + (other as User).username;
  }

  @override
  String toString() {
    return """
    username: $username,
    code: $code,
   
    ----------------------------------
    """;
  }
}
