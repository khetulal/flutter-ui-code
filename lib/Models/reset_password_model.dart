class ResetPasswordModel {
  List<String> success;

  ResetPasswordModel({this.success});

  ResetPasswordModel.fromJson(Map<String, dynamic> json) {
    success = json['success'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = this.success;
    return data;
  }
}
