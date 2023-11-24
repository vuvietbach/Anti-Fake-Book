//lib
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';
import 'package:redux/redux.dart';
import 'package:file_picker/file_picker.dart';

//module
import 'package:anti_fake_book/global_type/list_button_config.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:anti_fake_book/widgets/common/app_bar.dart';
import 'package:anti_fake_book/widgets/common/chip_tags.dart';
import 'package:anti_fake_book/widgets/common/list_button.dart';
import 'package:anti_fake_book/store/actions/index.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/index.dart';
import '../../widgets/common/text_button.dart';

//constants
import '../../constants/post.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  AddPostRequestDTO postData = AddPostRequestDTO();
  bool get isHaveContent {
    return postData.described.isNotEmpty ||
        postData.image.isNotEmpty ||
        postData.video.isNotEmpty;
  }

  List<Uint8List> tuan = [];
  Future<void> _pickImages() async {
    try {
      List<PlatformFile> result = await FilePicker.platform
          .pickFiles(
        type: FileType.image,
        allowMultiple: true,
      )
          .then((value) {
        return value != null ? value.files : [];
      });
      setState(() {
        result.forEach((element) {
          if (Platform.isAndroid) {
            final file = File(element.path!);
            postData.image.add(file.readAsBytesSync());
          } else {
            postData.image.add(element.bytes!);
          }
        });
      });
    } on Exception catch (e) {
      print(e);
    }
  }

  _getImageOnPressed() {
    return _pickImages();
  }

  void _getEmotionOnPressed() {
    context.go('/create-post/emotions');
  }

  final List<ListButtonItemConfig> listButtonConfig = [];
  _CreatePostScreenState() : super() {
    listButtonConfig.addAll([
      ListButtonItemConfig(_getImageOnPressed, 'Lấy ảnh/Lấy video',
          icon: 0xe332),
      ListButtonItemConfig(_getEmotionOnPressed, 'Cảm xúc/Hoạt động',
          icon: 0xe57d),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return StoreBuilder<AntiFakeBookState>(
        builder: (BuildContext context, Store<AntiFakeBookState> store) {
      return WillPopScope(
        onWillPop: () async {
          final shouldPop = await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Bạn có muốn thoát?'),
              actions: [
                TextButton(
                  child: Text('Không'),
                  onPressed: () => Navigator.of(context).pop(false),
                ),
                TextButton(
                  child: Text('Có'),
                  onPressed: () => Navigator.of(context).pop(true),
                ),
              ],
            ),
          );
          return shouldPop ?? false;
        },
        child: Scaffold(
          appBar: CommonAppBar(
            title: 'Tạo bài đăng',
            context: context,
            actions: [
              createTextButton(
                  isDisable: !isHaveContent,
                  onPressed: () {
                    store.dispatch(CreatePostAction(postData));
                    context.go('/');
                  },
                  title: 'Đăng'),
            ],
          ),
          body: Column(children: [
            Expanded(
                child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              NetworkImage(store.state.userState.avatar),
                        ),
                        const SizedBox(width: 8.0),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                store.state.userState.username,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const ChipTags(list: visibilityPost),
                            ])
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Nội dung',
                      ),
                      maxLines: null,
                      onChanged: (value) {
                        setState(() {
                          postData.described = value;
                        });
                      },
                    ),
                    if (postData.image.isNotEmpty)
                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        mainAxisSpacing: 0.5,
                        crossAxisSpacing: 0.5,
                        physics: const ScrollPhysics(),
                        children: postData.image.map((Uint8List file) {
                          return Stack(
                            alignment: Alignment.topRight,
                            children: <Widget>[
                              Image.memory(file),
                              Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: IconButton(
                                  icon: const Icon(Icons.close,
                                      color: Colors.red),
                                  onPressed: () {
                                    setState(() {
                                      postData.image.remove(file);
                                    });
                                  },
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      )
                  ],
                ),
              ),
            )),
            ListButton(screenWidth, listButtonConfig)
          ]),
        ),
      );
    });
  }
}
