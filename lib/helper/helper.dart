import 'package:anti_fake_book/store/state/index.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

enum ApiType { signIn, signUp, other, getVerifyCode, checkVerifyCode }

const int NetworkErrorCode = 0;
Future showErrorDialog(BuildContext context, int code,
    {ApiType apiType = ApiType.other}) async {
  if (context.mounted) {
    String? title;
    String? content;
    if (code == NetworkErrorCode) {
      title = "Lỗi kết nối";
      content = "Vui lòng kiểm tra lại kết nối mạng";
    } else {
      if (apiType == ApiType.signIn) {
        title = "Sai thông tin đăng nhập";
        content = "Vui lòng kiểm tra lại email hoặc mật khẩu";
      } else if (apiType == ApiType.signUp) {
        if (code == 9996) {
          title = "Email đã tồn tại";
          content = "Vui lòng kiểm tra lại email";
        }
      } else if (apiType == ApiType.getVerifyCode) {
        if (code == 1010 || code == 1009) {
          title = "Lỗi xác thực";
          content =
              "Email đã hoàn tất đăng ký hoặc người dùng gửi quá nhiều yêu cầu xác thực. Vui lòng đăng ký với email khác hoặc chờ 2 phút để gửi lại mã xác thực";
        } else if (code == 1004 || code == 9995) {
          title = "Email không tồn tại hoặc không đúng định dạng";
          content = "Vui lòng thử đăng ký lại";
        }
      } else if (apiType == ApiType.checkVerifyCode) {
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

bool isLogin(AntiFakeBookState state) {
  return state.userState.token != "";
}

Future<String> getDeviceId() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  return androidInfo.id;
}
