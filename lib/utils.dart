import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:json_annotation/json_annotation.dart';

// class CustomRoute {
//   final Widget widget;
//   final String path;
//   const CustomRoute({required this.path, required this.widget});
// }

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

bool isErrorCode(int code) {
  return code != 1000;
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

Future<void> writeJson(String path, Map<String, dynamic> data) async {
  try {
    // Encode the data as a JSON string
    final jsonString = jsonEncode(data);
    // Write the JSON string to the file
    final file = File(path);
    await file.writeAsString(jsonString);
    print('JSON data saved successfully!');
  } catch (error) {
    print('Error saving JSON data: $error');
  }
}

Future<Map<String, dynamic>> readJson(String filePath) async {
  try {
    final file = File(filePath);
    // Read the JSON string from the file
    final jsonString = await file.readAsString();
    // Decode the JSON string back into a Map
    return jsonDecode(jsonString);
  } catch (error) {
    print('Error reading JSON data: $error');
    return {}; // Return an empty Map if an error occurs
  }
}
