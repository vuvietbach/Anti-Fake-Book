class SignInRespone {
  final String code;
  final String message;

  SignInRespone(this.code, this.message);

}

Future<SignInRespone> signIn(String email, String password, String uuid) async {
  // ignore: avoid_print
  return SignInRespone("9995", "Đăng nhập thành công");
}