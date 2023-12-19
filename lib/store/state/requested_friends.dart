import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/base_apis/dto/response/get_requested_friends.dto.dart';
part 'requested_friends.g.dart';
part 'requested_friends.freezed.dart';

@unfreezed
class RequestedFriendsState with _$RequestedFriendsState {
  factory RequestedFriendsState({
    @Default([]) List<RequestedFriendsPayloadDTO> requests,
    @Default("") String total,
  }) = _RequestedFriendsState;

  factory RequestedFriendsState.fromJson(Map<String, dynamic> json) =>
      _$RequestedFriendsStateFromJson(json);
}
