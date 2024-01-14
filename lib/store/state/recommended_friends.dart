import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/base_apis/dto/response/get_recommended_friends.dto.dart';
part 'recommended_friends.g.dart';
part 'recommended_friends.freezed.dart';

@unfreezed
class RecommendedFriendsState with _$RecommendedFriendsState {
  factory RecommendedFriendsState(
          {@Default([]) List<RecommendedFriendsPayloadDTO> requests}) =
      _RecommendedFriendsState;

  factory RecommendedFriendsState.fromJson(Map<String, dynamic> json) =>
      _$RecommendedFriendsStateFromJson(json);
}
