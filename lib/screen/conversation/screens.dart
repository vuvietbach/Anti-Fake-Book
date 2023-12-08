import 'package:flutter/material.dart';

class NewMessage extends StatelessWidget {
  const NewMessage({super.key});
  static const imageUrl =
      'https://images.rawpixel.com/image_600/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTA4L3Jhd3BpeGVsX29mZmljZV8yNF9pbGx1c3RyYXRpb25fb2ZfYV9sYWJyYWRvcl9mdWxsX2JvZHlfc2l0dGluZ19kN2E1NjhkMS01MTBjLTRjMjktYTRmNS04YzExYTNlYmJkOTZfMS5qcGc.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Message'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 60.0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: Text(
                    "Tới:",
                    style: TextStyle(fontSize: 17.0),
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Hãy nhập tên hoặc nhóm',
                      border: InputBorder.none,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemBuilder: (
                    context,
                    index,
                  ) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 25.0,
                          backgroundImage: NetworkImage(
                              'https://images.rawpixel.com/image_600/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTA4L3Jhd3BpeGVsX29mZmljZV8yNF9pbGx1c3RyYXRpb25fb2ZfYV9sYWJyYWRvcl9mdWxsX2JvZHlfc2l0dGluZ19kN2E1NjhkMS01MTBjLTRjMjktYTRmNS04YzExYTNlYmJkOTZfMS5qcGc.jpg'),
                        ),
                        // contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                        title: Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Chat',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: 20))
        ],
      ),
    );
  }
}
