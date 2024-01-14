class GetListVideosRequestDTO {
  String token = '';
  String user_id;
  String in_campaign = '';
  String campaign_id = '';
  String latitude = '';
  String longitude = '';
  String last_id = '';
  String index;
  String count;

  GetListVideosRequestDTO(
      {required this.token,
      this.user_id = '',
      required this.in_campaign,
      required this.campaign_id,
      required this.latitude,
      required this.longitude,
      required this.last_id,
      this.index = '',
      this.count = ''});
}
