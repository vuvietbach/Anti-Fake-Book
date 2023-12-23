import 'package:anti_fake_book/models/base_apis/dto/response/index.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/user_info_data.dart';

String highlightPhoneNumbers(String text) {
  // Regular expression for phone numbers
  final phoneRegExp = RegExp(r'\(?\d{3}\)?[-.\s]?\d{3}[-.\s]?\d{4}');

  // Find all phone numbers in the text
  final matches = phoneRegExp.allMatches(text);

  // Highlight and separate phone numbers
  String highlightedText = '';
  int lastIndex = 0;
  for (final match in matches) {
    final phoneNumber = match.group(0);
    final formattedPhoneNumber = phoneNumber;
    print(phoneNumber);
    highlightedText +=
        '${text.substring(lastIndex, match.start)}$formattedPhoneNumber\u0332';
    lastIndex = match.end + 1;
  }

  // Add remaining text
  highlightedText += text.substring(lastIndex);

  return highlightedText;
}

void main() {
  // const text =
  //     'My phone number is (555) 123-4567. You can also reach me at 123-456-7890.';
  // final highlightedText = highlightPhoneNumbers(text);
  // print(highlightedText);
  // final text1 = "This is underlined text\u0332.\u0332";
  final x = GetListPostsResponseDTO.fromJson({"code": 1000, "message": "OK"});
  
}
