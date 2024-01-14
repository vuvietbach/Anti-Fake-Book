class GetRequestedFriendsRequestDTO {
  String token = '';
  String index;
  String count;

  GetRequestedFriendsRequestDTO(
      {required this.token, this.index = '', this.count = ''});
}
