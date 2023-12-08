import 'package:anti_fake_book/constants/constants.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/index.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/index.dart';
import 'package:anti_fake_book/screen/conversation/chat_page.dart';
import 'package:anti_fake_book/screen/conversation/screens.dart';
import 'package:anti_fake_book/screen/conversation/setting.dart';
import 'package:anti_fake_book/screen/conversation/widgets.dart';
import 'package:anti_fake_book/store/actions/conversation.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:image_picker/image_picker.dart';
import 'package:redux/redux.dart';

class ChatMainPage extends StatelessWidget {
  const ChatMainPage({super.key});
  Future takePhoto() async {
    await ImagePicker().pickImage(source: ImageSource.camera);
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder(onInit: (Store<AntiFakeBookState> store) {
      store.dispatch(GetListConversationAction(
        data: GetListConversationRequest(
          index: '$DEFAULT_INDEX',
          count: '$DEFAULT_COUNT',
          token: store.state.userState.token,
        ),
      ));
    }, builder: (BuildContext context, Store<AntiFakeBookState> store) {
      List<ConversationInfo> listMessage =
          store.state.conversationState.conversations;
      return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ChatSetting(),
                ));
              },
              child: const CircleAvatar(
                radius: 20.0,
                backgroundImage: NetworkImage(
                  userAvatar,
                ),
              ),
            ),
          ),
          title: const Text(
            'Chat',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.camera_alt),
              onPressed: () async {
                await takePhoto();
              },
            ),
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const NewMessage(),
                ));
              },
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: listMessage.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const ChatSlide();
            } else {
              return chatItem(context, listMessage[index - 1]);
            }
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble), label: "Chat"),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: "Danh bạ"),
          ],
          currentIndex: 0,
        ),
      );
    });
  }

  InkWell chatItem(BuildContext context, ConversationInfo chat) {
    bool unread = chat.lastMessage.unread == 1;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ChatPage(),
        ));
      },
      child: ListTile(
        focusColor: Colors.grey,
        leading: CircleAvatar(
          radius: 27.0,
          backgroundImage: NetworkImage(
            chat.partner.avatar,
          ),
        ),
        title: Text(
          chat.partner.username,
          style: TextStyle(
              fontSize: 20.0, fontWeight: unread ? FontWeight.bold : null),
        ),
        subtitle: Row(
          children: [
            Expanded(
              child: Text(
                chat.lastMessage.message,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: unread ? Colors.black : Colors.grey[500],
                    fontWeight: unread ? FontWeight.bold : null),
              ),
            ),
            Text(
              chat.lastMessage.created,
            )
          ],
        ),
      ),
    );
  }
}
