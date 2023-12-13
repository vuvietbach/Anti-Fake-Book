import 'package:json_annotation/json_annotation.dart';

enum TypeNotification {
  @JsonValue('comment')
  comment,
  @JsonValue('react')
  react,
}

enum TypeGroup {
  @JsonValue(0)
  notification,
  @JsonValue(1)
  action,
}

enum ReadType {
  @JsonValue(0)
  unread,
  @JsonValue(1)
  read,
}
