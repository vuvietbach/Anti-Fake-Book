class GetRecommendedFriendsRequestDTO {
  String token = '';
  String index;
  String count;

  GetRecommendedFriendsRequestDTO(
      {required this.token, this.index = '', this.count = ''});
}
