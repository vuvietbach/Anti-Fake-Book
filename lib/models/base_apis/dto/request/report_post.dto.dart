import 'package:anti_fake_book/utils.dart';
part 'report_post.dto.g.dart';

@customJsonSerializable
class ReportPostRequestDto {
  final String id;
  final List<String> subject;
  final String details;
  ReportPostRequestDto(
      {required this.id, required this.subject, required this.details});
  factory ReportPostRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ReportPostRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ReportPostRequestDtoToJson(this);
}
