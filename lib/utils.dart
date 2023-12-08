import 'dart:convert';

import 'package:anti_fake_book/models/base_apis/dto/response/index.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      // ignore: prefer_void_to_null
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
class CustomIntConverter implements JsonConverter<int, dynamic> {
  const CustomIntConverter();

  @override
  int fromJson(dynamic json) {
    switch (json.runtimeType) {
      case String:
        return int.parse(json);
      case bool:
        return json ? 1 : 0;
    }
    return json;
  }

  @override
  int toJson(int object) {
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

class CustomUint8ListConverter implements JsonConverter<Uint8List, dynamic> {
  const CustomUint8ListConverter();

  @override
  Uint8List fromJson(dynamic json) {
    if (json is Uint8List) return json;
    return base64Decode(json);
  }

  @override
  Uint8List toJson(Uint8List object) {
    return object;
  }
}

const customJsonSerializable = JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  includeIfNull: false,
  converters: [
    CustomBoolConverter(),
    CustomIntConverter(),
    CustomStringConvert(),
    CustomUint8ListConverter(),
  ],
);

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email không được để trống';
  } else if (!EmailValidator.validate(value)) {
    return 'Email không hợp lệ';
  } else {
    return null;
  }
}

Future<String> getDeviceId() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  return androidInfo.id;
}

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

Future showLoadingDialog(BuildContext context) async {
  if (context.mounted) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return const Stack(
          children: [
            // Background overlay
            Opacity(
              opacity: 0.5,
              child: ModalBarrier(
                color: Colors.black,
                dismissible: true,
              ),
            ),
            // Loading indicator
            Center(
              child: CircularProgressIndicator(),
            ),
          ],
        );
      },
    );
  }
}

enum PageType { signIn, signUp, other, getVerifyCode, checkVerifyCode }

const int NetworkErrorCode = 0;

Future showErrorDialog(BuildContext context, int code,
    {PageType pageType = PageType.other}) async {
  if (context.mounted) {
    String? title;
    String? content;
    if (code == NetworkErrorCode) {
      title = "Lỗi kết nối";
      content = "Vui lòng kiểm tra lại kết nối mạng";
    } else {
      if (pageType == PageType.signIn) {
        title = "Sai thông tin đăng nhập";
        content = "Vui lòng kiểm tra lại email hoặc mật khẩu";
      } else if (pageType == PageType.signUp) {
        if (code == 9996) {
          title = "Email đã tồn tại";
          content = "Vui lòng kiểm tra lại email";
        }
      } else if (pageType == PageType.getVerifyCode) {
        if (code == 1010) {
          title = "Email đã được dùng để đăng ký cho tài khoản khác";
        } else if (code == 1004 || code == 9995) {
          title = "Email không tồn tại hoặc không đúng định dạng";
          content = "Vui lòng thử đăng ký lại";
        }
      } else if (pageType == PageType.checkVerifyCode) {
        if (code == 9995 || code == 1004 || code == 9996) {
          title = "Mã xác thực không hợp lệ";
          content = "Vui lòng kiểm tra mã xác thực";
        }
      }
    }
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: title != null ? Text(title) : null,
              content: content != null ? Text(content) : null,
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

bool isErrorCode(int code) {
  return code != ResponseDTO.DEFAULT_CODE && code != 1000;
}

bool isLogin(AntiFakeBookState state) {
  return state.userState.token != "";
}

// Future<File> getLocalJsonFile(String fileName) async {
//   final directory = await getApplicationDocumentsDirectory();
//   return File('${directory.path}/$fileName');
// }

// Future<void> saveToJsonFile(
//     String fileName, Map<String, dynamic> jsonContent) async {
//   final file = await getLocalJsonFile(fileName);
//   final jsonString = json.encode(jsonContent);
//   await file.writeAsString(jsonString);
// }

Future<Map<String, dynamic>> readFromJsonFile(String fileName) async {
  final jsonString = await rootBundle.loadString(fileName);
  final jsonMap = json.decode(jsonString);
  return jsonMap;
}

Future saveStateToDisk(AntiFakeBookState state) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString("email", state.userState.email);
  await prefs.setString("token", state.userState.token);
  await prefs.setString("username", state.userState.username);
}

//Convert Uint8List to  MultipartFile.fromBytes(e, filename: e.toString()) recursively
convertUint8ListToMultipartFile(input) {
  if (input is Uint8List) {
    return MultipartFile.fromBytes(input, filename: input.toString());
  } else if (input is List) {
    return input.map((e) => convertUint8ListToMultipartFile(e)).toList();
  }
  if (input is Map) {
    return input.map((key, value) {
      return MapEntry(key, convertUint8ListToMultipartFile(value));
    });
  }
  return input;
}

String timeAgo(DateTime created) {
  int difference = DateTime.now().difference(created).inDays;
  if (difference > 0) {
    return '$difference ngày';
  }
  difference = DateTime.now().difference(created).inHours;
  if (difference > 0) {
    return '$difference giờ';
  }
  difference = DateTime.now().difference(created).inMinutes;
  if (difference > 0) {
    return '$difference phút';
  }
  difference = DateTime.now().difference(created).inSeconds;
  return '$difference giây';
}

bool isSuccessCode(int code) {
  return code == 1000;
}
