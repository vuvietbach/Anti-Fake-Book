import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});
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

class WaitingMessage extends StatelessWidget {
  const WaitingMessage({super.key});

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
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
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

class NewMessage extends StatelessWidget {
  const NewMessage({super.key});
  static const  imageUrl =
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
