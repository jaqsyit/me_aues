// To parse this JSON data, do
//
//     final loginData = loginDataFromJson(jsonString);

import 'dart:convert';

LoginData loginDataFromJson(String str) => LoginData.fromJson(json.decode(str));

String loginDataToJson(LoginData data) => json.encode(data.toJson());

class LoginData {
    String authToken;
    String loginStatus;
    String sid;

    LoginData({
        required this.authToken,
        required this.loginStatus,
        required this.sid,
    });

    factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        authToken: json["auth_token"],
        loginStatus: json["login_status"],
        sid: json["sid"],
    );

    Map<String, dynamic> toJson() => {
        "auth_token": authToken,
        "login_status": loginStatus,
        "sid": sid,
    };
}
