import 'package:anti_fake_book/utils.dart';

part 'post.dto.g.dart';

@customJsonSerializable
class GetListPostsRequest {
  final String? userId;
  final int? inCampaign;
  final String? campaignId;
  final String? longitude;
  final String? latitude;
  final String? lastId;
  final int index;
  final int count;
  GetListPostsRequest(
      {this.userId,
      this.inCampaign,
      this.campaignId,
      this.longitude,
      this.latitude,
      this.lastId,
      required this.index,
      required this.count});
  Map<String, dynamic> toJson() => _$GetListPostsRequestToJson(this);

  factory GetListPostsRequest.fromJson(Map<String, dynamic> json) =>
      _$GetListPostsRequestFromJson(json);
}
