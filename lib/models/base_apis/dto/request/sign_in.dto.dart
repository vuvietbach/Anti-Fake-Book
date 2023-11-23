class SignInRequestDTO {
  String email;
  String password;
  String? deviceId;
  SignInRequestDTO({
    required this.email,
    required this.password,
    this.deviceId,
  });
}
