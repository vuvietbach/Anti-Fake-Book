import 'package:anti_fake_book/models/base_apis/dto/response/index.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/response.dto.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/search.dto.dart';
import 'package:anti_fake_book/screen/HomePage/news_feed_tab.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum ApiType {
  signIn,
  signUp,
  other,
  getVerifyCode,
  checkVerifyCode,
  getUserInfo,
  setUserInfo,
  changeProfileAfterSignUp
}

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
    if (code == 9998) {
      title = "Lỗi xác thực";
      content = "Vui lòng đăng nhập lại";
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(title!),
              content: Text(content!),
              actions: [
                TextButton(
                    onPressed: () {
                      context.go("/welcome");
                    },
                    child: const Text("Chuyển đến trang đăng nhập"))
              ],
            );
          });
    } else {
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
  return state.token != "";
}

Future<String> getDeviceId() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  return androidInfo.id;
}

void showConfirmDialog(BuildContext context, String? title, String? content,
    {Function? onConfirm}) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: title != null ? Text(title) : null,
          content: content != null ? Text(content) : null,
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Hủy")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  if (onConfirm != null) {
                    onConfirm();
                  }
                },
                child: const Text("Đồng ý"))
          ],
        );
      });
}

bool isAccountOwner(String? userId, AntiFakeBookState state) {
  return userId == null || userId == state.userState.userInfo.id;
}

void showUsernameErrorDialog(BuildContext context) async {
  await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Tên người dùng không hợp lệ"),
          content: const Text(
              "Tên người dùng không được để trống, không được chứa ký tự đặc biệt, độ dài từ 6 đến 30 ký tự, không được trùng với email"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Đóng"))
          ],
        );
      });
}

void showError(BuildContext context, DioException e) {
  bool isStandardError = true;
  late ResponseDTO responseDTO;
  try {
    responseDTO = ResponseDTO.fromJson(e.response!.data);
  } catch (e) {
    isStandardError = false;
  }
  String title = isStandardError ? responseDTO.code.toString() : "Lỗi";
  String content = isStandardError ? responseDTO.message : e.toString();
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Đóng"))
          ],
        );
      });
}

void callAPI(BuildContext context, Future<void> Function() api,
    {Function? finalCallback}) async {
  try {
    await api();
  } on DioException catch (e) {
    // ignore: use_build_context_synchronously
    showError(context, e);
  } finally {
    if (finalCallback != null) {
      finalCallback();
    }
  }
}

// List<Post> convertFromResponseToListPost() {
//   List<Post> res = [];
//   // print(response);
//   List<Map<String, dynamic>> rawData = response;
//   int lengthListPost = rawData.length;
//   for (int i = 0; i < lengthListPost; i++) {
//     Map<String, dynamic> thisPost = rawData[i];
//     List<String> imageUrls = thisPost['image']
//         .map((item) => item['url'].toString())
//         .toList()
//         .cast<String>();
//     res.add(Post(
//         thisPost['id'],
//         thisPost['author']['id'],
//         thisPost['described'],
//         imageUrls,
//         thisPost['video'] ?? '',
//         int.parse(thisPost['feel']),
//         int.parse(thisPost['comment_mark']),
//         DateTime.parse(thisPost['created']),
//         thisPost['author']['avatar'],
//         thisPost['is_felt'] ?? '-1'));
//   }
//   return res;
// }

Post convertToPost(SearchResultItem item) {
  List<String> imageUrls = item.image?.map((e) => e.url).toList() ?? [];
  return Post(
      item.id,
      item.author.id,
      item.author.username,
      item.described,
      imageUrls,
      item.video?.url ?? '',
      item.feel,
      item.markComment,
      DateTime.parse(item.created),
      item.author.avatar,
      item.isFelt.toString());
}

Post convertToPostFromPostPayload(EachPostPayloadDTO item) {
  EachPostPayloadDTO post = item;
  String id = post.id ?? "";
  String userId = post.author?.id ?? "";
  String username = post.author?.name ?? "";
  String content = post.described ?? "";

  int kudosCount = int.parse(post.feel ?? "0");
  // int disappointedCount = random.nextInt(200);
  int commentCount = int.parse(post.commentMark ?? "0");

  List<String> imageURL = [];
  for (int i = 0; i < post.image.length; i++) {
    imageURL.add(post.image[i].url ?? "");
  }

  String? videoURL = post.video?.url;

  DateTime postDate = DateTime.parse(post.created ?? "");
  String userAvatar = post.author?.avatar ?? '';

  String? isFelt = post.isFelt;

  return Post(id, userId, username, content, imageURL, videoURL ?? '',
      kudosCount, commentCount, postDate, userAvatar, isFelt ?? "-1");
}