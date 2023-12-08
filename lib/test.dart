import 'package:anti_fake_book/models/base_apis/dto/response/user_info.dto.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_linkify/flutter_linkify.dart';

void main() {
  final userInfo = {
    "created": "3",
    "description": "4",
    "avatar": "5",
    "cover_image": "6",
    "link": "7",
    "address": "8",
    "city": "9",
    "country": "10",
    "listing": 11,
    "is_friend": 12,
    "online": 13,
    "coins": 14,
  };
  final userInfoData = UserInfoData.fromJson(userInfo);
  print(userInfoData);
}

class TestPhoneApp extends StatefulWidget {
  const TestPhoneApp({super.key});

  @override
  State<TestPhoneApp> createState() => _TestPhoneAppState();
}

class _TestPhoneAppState extends State<TestPhoneApp> {
  final String _phoneNumberText = "0123456789";

  void _makePhoneCall() async {
    String phoneNumber = Uri.encodeFull(_phoneNumberText);
    final url = 'tel:$phoneNumber';
    // final url = 'https://www.youtube.com/';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw Exception('Could not launch phone app.');
    }
  }

  @override
  Widget build(BuildContext context) {
    // return GestureDetector(
    //   onTap: _makePhoneCall,
    //   child: Text(_phoneNumberText),
    // );
    return Linkify(
      onOpen: (link) async {
        if (await canLaunchUrl(Uri.parse(link.url))) {
          await launchUrl(Uri.parse(link.url));
        } else {
          throw Exception('Could not launch phone app.');
        }
      },
      text: 'This text contains a link: https://www.example.com',
      style: const TextStyle(color: Colors.blue),
      linkStyle: const TextStyle(color: Colors.blue),
    );
  }
}
