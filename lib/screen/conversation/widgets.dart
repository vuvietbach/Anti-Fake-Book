import 'package:anti_fake_book/models/base_apis/dto/response/index.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class ChatSlide extends StatelessWidget {
  const ChatSlide({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StoreBuilder(
        builder: (BuildContext context, Store<AntiFakeBookState> store) {
      return ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 110),
        child: ListView.builder(
            itemCount: store.state.conversationState.conversations.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return _user(
                  store.state.conversationState.conversations[index].partner);
            }),
      );
    });
  }

  Widget _user(PartnerData partner) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        width: 60,
        child: Column(
          children: [
            CircleAvatar(
              radius: 27.0,
              backgroundImage: NetworkImage(
                partner.avatar,
              ),
            ),
            Text(
              partner.username,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
