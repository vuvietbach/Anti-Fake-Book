import 'package:anti_fake_book/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_summary.entity.freezed.dart';
part 'user_summary.entity.g.dart';

@freezed
abstract class UserSummaryEntity with _$UserSummaryEntity {
  // ignore: invalid_annotation_target
  @customJsonSerializable
  const factory UserSummaryEntity({
    required String id,
    required String name,
    required String avatar,
    int? coins,
  }) = _UserSummaryEntity;

  factory UserSummaryEntity.fromJson(Map<String, dynamic> json) =>
      _$UserSummaryEntityFromJson(json);
}
