class ResponseUser {
  bool? success;
  String? token;

  ResponseUser({this.success, this.token});

  factory ResponseUser.fromjson(Map<String, dynamic> json) {
    return ResponseUser(success: json['Success'], token: json['token']);
  }
}
