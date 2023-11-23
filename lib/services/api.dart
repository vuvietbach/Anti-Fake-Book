class SignInRespone {
  final String code;
  final String message;

  SignInRespone(this.code, this.message);
}

Future<SignInRespone> signIn(String email, String password, String uuid) async {
  // ignore: avoid_print
  return SignInRespone("9995", "Đăng nhập thành công");
}

class SignUpRespone {
  final String code;
  final String message;
  // final data
  // TODO: add data

  SignUpRespone(this.code, this.message);
}

Future<String> signUp(String email, String password, String uuid) async {
  // ignore: avoid_print
  /*
    * 1000, OK
    * 9996, User existed
    * 
  */
  return "1000";
}

Future<String> getVerifyCode(String email) async {
  // ignore: avoid_print
  /*
    * 1000, OK
    * 1010, email hoan tat
    * 9995 || 1004, email chua duoc dang ky
    * 1004, email sai dinh dang
  */
  return "1010";
}

Future<String> checkVerifyCode(String email, String code) async {
  // ignore: avoid_print
  /*
    * 1000, OK
    * 9995, code sai
    * 1004, code sai dinh dang
  */
  return "1000";
}
