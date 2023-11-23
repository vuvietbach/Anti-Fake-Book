import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:device_info/device_info.dart';

class CustomRoute {
  final Widget widget;
  final String path;
  const CustomRoute({required this.path, required this.widget});
}

class Account {
  final String name;
  final String avatarUrl;
  const Account({required this.name, required this.avatarUrl});
}

class CustomBoolConverter implements JsonConverter<bool?, dynamic> {
  const CustomBoolConverter();

  @override
  bool? fromJson(dynamic json) {
    switch (json.runtimeType) {
      case String:
        return bool.parse(json);
      case int:
        return json != 0;
      case bool:
        return json;
      case Null:
        return null;
    }
    return true;
  }

  @override
  bool? toJson(bool? object) {
    return object;
  }
}

//class convert string vể số
class CustomIntConverter implements JsonConverter<int?, dynamic> {
  const CustomIntConverter();

  @override
  int? fromJson(dynamic json) {
    switch (json.runtimeType) {
      case String:
        return int.parse(json);
      case bool:
        return json ? 1 : 0;
    }
    return json;
  }

  @override
  int? toJson(int? object) {
    return object;
  }
}

//class convert sô sang string
class CustomStringConvert implements JsonConverter<String, dynamic> {
  const CustomStringConvert();

  @override
  String fromJson(dynamic json) {
    return json.toString();
  }

  @override
  String toJson(String object) {
    return object;
  }
}

const customJsonSerializable = JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  converters: [
    CustomBoolConverter(),
    CustomIntConverter(),
    CustomStringConvert()
  ],
);
String? validatePassword(String? password, String? email) {
  if (password == null || password.isEmpty) {
    return 'Mật khẩu không được để trống';
  } else if (password.length < 6 || password.length > 10) {
    return 'Mật khẩu phải có độ dài từ 6 đến 10 ký tự';
  } else if (password.contains(" ")) {
    return 'Mật khẩu không được chứa khoảng trắng';
  } else if (password == email) {
    return 'Mật khẩu không được trùng với email';
  } else {
    return null;
  }
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email không được để trống';
  } else if (!EmailValidator.validate(value)) {
    return 'Email không hợp lệ';
  } else {
    return null;
  }
}

Future<String> getDeviceId(BuildContext context) async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  return androidInfo.androidId;
}

bool isSuccessCode(String code) {
  return code == "1000";
}

Future<void> showErrorDialog(BuildContext context, String code,
    [String? screenCode]) async {
  if (screenCode == 'verify_code') {
    /*
      * 1000, OK
      * 1004 || 9995, email chua duoc dang ky
      * 1004 || 9996, email da duoc hoan tat dang ky
    */
  } else {
    if (code == "9996" || code == "1010") {
      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: const Text("Email đã được sử dụng"),
                content: const Text("Vui lòng kiểm tra lại email"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Đóng"))
                ],
              ));
    } else if (code == "1004") {
      String title = "Thông tin không hợp lệ";
      String content = "Vui lòng kiểm tra lại thông tin";
      if (screenCode == "sign_up") {
        title = "Thông tin không hợp lệ";
        content = "Vui lòng kiểm tra lại email hoặc mật khẩu";
      }
      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: Text(title),
                content: Text(content),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Đóng"))
                ],
              ));
    }
  }
}
