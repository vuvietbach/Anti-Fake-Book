import 'package:flutter/material.dart';

class WaitingMessage extends StatelessWidget {
  const WaitingMessage({super.key});
  Widget _popupMenuButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: PopupMenuButton(
        child: const Icon(Icons.more_vert),
        itemBuilder: (context) => [
          PopupMenuItem(
            onTap: () {},
            child: const Text("Xóa tin nhắn đang chờ"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tin nhắn đang chờ'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [_popupMenuButton()],
      ),
      body: ListView.builder(
          itemBuilder: (
            context,
            index,
          ) {
            String date = "9 tháng 9, 2020";
            return ListTile(
              leading: const CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(
                    'https://images.rawpixel.com/image_600/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTA4L3Jhd3BpeGVsX29mZmljZV8yNF9pbGx1c3RyYXRpb25fb2ZfYV9sYWJyYWRvcl9mdWxsX2JvZHlfc2l0dGluZ19kN2E1NjhkMS01MTBjLTRjMjktYTRmNS04YzExYTNlYmJkOTZfMS5qcGc.jpg'),
              ),
              // contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              title: const Text(
                'Vũ Việt Bách',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Tin nhắn mới $date',
                style: TextStyle(color: Colors.grey[500]),
              ),
            );
          },
          itemCount: 10),
    );
  }
}
