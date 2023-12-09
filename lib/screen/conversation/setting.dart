import 'package:anti_fake_book/screen/conversation/screens.dart';
import 'package:anti_fake_book/screen/conversation/waiting_message.dart';
import 'package:flutter/material.dart';

class ChatSetting extends StatelessWidget {
  const ChatSetting({super.key});
  static const imageUrl =
      'https://images.rawpixel.com/image_600/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTA4L3Jhd3BpeGVsX29mZmljZV8yNF9pbGx1c3RyYXRpb25fb2ZfYV9sYWJyYWRvcl9mdWxsX2JvZHlfc2l0dGluZ19kN2E1NjhkMS01MTBjLTRjMjktYTRmNS04YzExYTNlYmJkOTZfMS5qcGc.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tôi'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const CircleAvatar(
          radius: 50.0,
          backgroundImage: NetworkImage(imageUrl),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Name',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        ListTile(
          leading: Container(
            width: 50,
            height: 50,
            decoration:
                const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
            child: const Icon(Icons.message, color: Colors.white),
          ),
          title:
              const Text('Tin nhắn đang chờ', style: TextStyle(fontSize: 20.0)),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const WaitingMessage(),
            ));
          },
        ),
      ]),
    );
  }
}
