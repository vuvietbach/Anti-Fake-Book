import 'package:anti_fake_book/test/common_actions.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/index.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/index.dart';
import 'package:anti_fake_book/screen/conversation/profile.dart';
import 'package:anti_fake_book/screen/conversation/setting.dart';
import 'package:anti_fake_book/store/actions/conversation.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  static const avatarUrl =
      'https://images.rawpixel.com/image_600/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTA4L3Jhd3BpeGVsX29mZmljZV8yNF9pbGx1c3RyYXRpb25fb2ZfYV9sYWJyYWRvcl9mdWxsX2JvZHlfc2l0dGluZ19kN2E1NjhkMS01MTBjLTRjMjktYTRmNS04YzExYTNlYmJkOTZfMS5qcGc.jpg';

  Widget _textInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Icon(Icons.emoji_emotions, color: Colors.blue),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Nhập tin nhắn',
                filled: true,
                fillColor: Colors.grey[200], // Grey background color
                hintStyle: const TextStyle(color: Colors.grey),
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none, // Remove border
                  borderRadius:
                      BorderRadius.circular(30.0), // Adjust the border radius
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16.0), // Adju
              ),
            ),
          ),
          const SizedBox(width: 8),
          const Icon(
            Icons.thumb_up,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }

  Widget? _title(BuildContext context, Store<AntiFakeBookState> store) {
    String avatarUrl = store.state.userState.searchedUserInfo.avatar;
    String username = store.state.userState.searchedUserInfo.username;
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const ChatPartnerInfoPage(),
      )),
      child: Row(children: [
        CircleAvatar(
          backgroundImage: NetworkImage(avatarUrl),
        ),
        const SizedBox(width: 10),
        Text(
          username,
          style: const TextStyle(fontWeight: FontWeight.bold),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const Spacer(),
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.blue,
          ),
          child: const Center(
            child: Text(
              "i",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder(onInit: (Store<AntiFakeBookState> store) {
      getUserInfo(store);
      getConversation(store);
    }, builder: (BuildContext context, Store<AntiFakeBookState> store) {
      return Scaffold(
        appBar: AppBar(
          title: _title(context, store),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(children: [
          const ListMessage(),
          _textInput(),
        ]),
      );
    });
  }
}

class ListMessage extends StatelessWidget {
  const ListMessage({super.key});
  bool isMyMessage(ConversationData message) {
    return message.sender.id == "0";
  }

  Widget _messageBubble(BuildContext context, ConversationData message,
      {ConversationData? nextMessage, ConversationData? previousMessage}) {
    bool isMy = isMyMessage(message);
    Widget bubble = Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.7,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: isMy ? Colors.blue : Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        message.message,
        style: TextStyle(color: isMy ? Colors.white : Colors.black),
      ),
    );
    bubble = Align(
      alignment: isMy ? Alignment.centerRight : Alignment.centerLeft,
      child: bubble,
    );
    // TODO: add avatar
    bool hasDate =
        (previousMessage == null || previousMessage.created != message.created);
    bubble = Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        children: [
          hasDate ? Text(message.created) : const SizedBox(height: 0),
          bubble,
        ],
      ),
    );
    return bubble;
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder(
        builder: (BuildContext context, Store<AntiFakeBookState> store) {
      ConversationMetadata data =
          store.state.conversationState.currentConversation;
      return Expanded(
          child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        itemBuilder: (context, index) {
          if (index == 0) {
            return const SizedBox(height: 10);
          } else {
            ConversationData? nextMessage = index < data.conversation.length
                ? data.conversation[index]
                : null;
            ConversationData? previousMessage =
                index > 1 ? data.conversation[index - 2] : null;
            return _messageBubble(context, data.conversation[index - 1],
                nextMessage: nextMessage, previousMessage: previousMessage);
          }
        },
        itemCount: data.conversation.length + 1,
      ));
    });
  }
}
