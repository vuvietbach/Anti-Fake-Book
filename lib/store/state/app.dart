import 'package:anti_fake_book/constants/constants.dart';
import 'package:anti_fake_book/utils.dart';
part 'app.g.dart';
@customJsonSerializable
class AppState {
  AppStatus status;
  AppState.initState() : status = AppStatus.loaded;
  AppState({this.status = AppStatus.loaded});
}
