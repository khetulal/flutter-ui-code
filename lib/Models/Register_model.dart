class RegisterModel {
  int id;
  String username;
  String email;
  String firstName;
  String lastName;
  String phoneNumber;
  Token token;

  RegisterModel(
      {this.id,
      this.username,
      this.email,
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.token});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phoneNumber = json['phone_number'];
    token = json['token'] != null ? Token.fromJson(json['token']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone_number'] = phoneNumber;
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
