class LoginModel {
  int status;
  int user;
  List<String> userRole;
  Token token;

  LoginModel({this.status, this.user, this.userRole, this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    user = json['user'];
    userRole = json['user-role'].cast<String>();
    token = json['token'] != null ? Token.fromJson(json['token']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['user'] = user;
    data['user-role'] = userRole;
    if (token != null) {
      data['token'] = token.toJson();
    }
    return data;
  }
}

class Token {
  String refresh;
  String access;

  Token({this.refresh, this.access});

  Token.fromJson(Map<String, dynamic> json) {
    refresh = json['refresh'];
    access = json['access'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['refresh'] = refresh;
    data['access'] = access;
    return data;
  }
}
