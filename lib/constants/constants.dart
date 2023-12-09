const appName = "Anti Fake Book";

enum AppStatus {
  loading,
  loaded,
  error,
}

const int DEFAULT_COUNT = 20;
const int DEFAULT_INDEX = 20;
const String userAvatar =
    "https://images.rawpixel.com/image_600/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTA4L3Jhd3BpeGVsX29mZmljZV8yNF9pbGx1c3RyYXRpb25fb2ZfYV9sYWJyYWRvcl9mdWxsX2JvZHlfc2l0dGluZ19kN2E1NjhkMS01MTBjLTRjMjktYTRmNS04YzExYTNlYmJkOTZfMS5qcGc.jpg";

class CodeActive {
  static const int ACTIVE = 1;
  static const int INACTIVE = 0;
  static const int CHANGE_INFO_PENDING = -1;
}
