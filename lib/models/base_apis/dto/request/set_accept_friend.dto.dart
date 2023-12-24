class SetAcceptFriendRequestDTO {
  String token = '';
  String user_id;
  String is_accept;

  SetAcceptFriendRequestDTO(
      {required this.token, required this.user_id, required this.is_accept});
}
