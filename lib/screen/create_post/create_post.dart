//lib
import 'dart:io';
import 'dart:typed_data';
import 'package:anti_fake_book/models/base_apis/dto/response/get_post.dto.dart';
import 'package:anti_fake_book/store/state/user.dart';
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
  // AddPostRequestDTO postData = AddPostRequestDTO();
  // bool get isHaveContent {
  //   return postData.described.isNotEmpty ||
  //       postData.image.isNotEmpty ||
  //       postData.video.isNotEmpty;
  // }

  _getImageOnPressed(_CreatePostViewModel vm) {
    return () async {
      try {
        List<PlatformFile> result = await FilePicker.platform
            .pickFiles(
          type: FileType.image,
          allowMultiple: true,
        )
            .then((value) {
          return value != null ? value.files : [];
        });
        result.forEach((element) {
          if (Platform.isAndroid) {
            final file = File(element.path!);
            vm.addImage(file.readAsBytesSync());
          } else {
            vm.addImage(element.bytes!);
          }
        });
      } on Exception catch (e) {
        print(e);
      }
    };
  }

  void _getEmotionOnPressed() {
    context.go('/create-post/emotions');
  }

  // final List<ListButtonItemConfig> listButtonConfig = [];
  List<ListButtonItemConfig> getListButtionConfig(_CreatePostViewModel vm) {
    return [
      ListButtonItemConfig(_getImageOnPressed(vm), 'Lấy ảnh/Lấy video',
          icon: 0xe332),
      ListButtonItemConfig(_getEmotionOnPressed, 'Cảm xúc/Hoạt động',
          icon: 0xe57d),
    ];
  }

  List<ListButtonItemConfig> getListButttonOutPage() {
    return [
      ListButtonItemConfig(() {
        setState(() {
          isShowButtonSheet = false;
        });
        context.go('/');
      }, 'Lưu làm bản nháp', icon: 0xe0f1),
      ListButtonItemConfig(() {
        setState(() {
          isShowButtonSheet = false;
        });
        context.go('/');
      }, 'Bỏ bài viết', icon: 0xe1bb),
      ListButtonItemConfig(() {
        setState(() {
          isShowButtonSheet = false;
        });
      }, 'Tiếp tục chỉnh sửa', icon: 0xe156),
    ];
  }

  bool isShowButtonSheet = false;

  _CreatePostScreenState() : super();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return StoreConnector<AntiFakeBookState, _CreatePostViewModel>(
        converter: (store) => _CreatePostViewModel(store),
        builder: (BuildContext context, _CreatePostViewModel vm) {
          return WillPopScope(
            onWillPop: () async {
              // cập nhật state isShowButtonSheet thành true
              setState(() {
                isShowButtonSheet = true;
              });
              print(isShowButtonSheet);
              return false;
            },
            child: Scaffold(
              appBar: CommonAppBar(
                title: 'Tạo bài đăng',
                context: context,
                onPressedLeading: () {
                  print('dm');
                  // cập nhật state isShowButtonSheet thành true
                  setState(() {
                    isShowButtonSheet = true;
                  });
                },
                actions: [
                  createTextButton(
                      isDisable: !vm.isHaveContent,
                      onPressed: () {
                        vm.onCreatePost();
                        context.go('/');
                      },
                      title: 'Đăng'),
                ],
              ),
              body: Container(
                child: Column(children: [
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
                                    NetworkImage(vm.userInfomation.avatar),
                              ),
                              const SizedBox(width: 8.0),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      vm.userInfomation.username,
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
                              vm.updateDescribed(value);
                            },
                          ),
                          if (vm.postData.image.isNotEmpty)
                            GridView.count(
                              crossAxisCount: 2,
                              shrinkWrap: true,
                              mainAxisSpacing: 0.5,
                              crossAxisSpacing: 0.5,
                              physics: const ScrollPhysics(),
                              children: vm.postData.image.map((Uint8List file) {
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
                                            vm.removeImage(file);
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
                  ListButton(
                      screenWidth,
                      !isShowButtonSheet
                          ? getListButtionConfig(vm)
                          : getListButttonOutPage())
                ]),
              ),
            ),
          );
        });
  }
}

class _CreatePostViewModel {
  late final AddPostRequestDTO postData;
  late final UserState userInfomation;
  bool get isHaveContent {
    return postData.described.isNotEmpty ||
        postData.image.isNotEmpty ||
        postData.video.isNotEmpty;
  }

  late final Function addImage;
  late final Function removeImage;
  late final Function updateDescribed;
  late final Function onEditPost;
  late final Function onCreatePost;

  _CreatePostViewModel(Store<AntiFakeBookState> store) {
    addImage = (Uint8List file) {
      final images = [
        ...store.state.postState.selected.images,
        ImagePayloadDTO(id: '', url: '', bytes: file)
      ];
      store.dispatch(SetSelectedPostAction(
          store.state.postState.selected.copyWith(images: images)));
    };

    removeImage = (Uint8List file) {
      final images = [
        ...store.state.postState.selected.images
            .where((element) => element.bytes != file)
      ];
      store.dispatch(SetSelectedPostAction(
          store.state.postState.selected.copyWith(images: images)));
    };

    updateDescribed = (String described) {
      store.dispatch(SetSelectedPostAction(
          store.state.postState.selected.copyWith(described: described)));
    };

    onCreatePost = () {
      store.dispatch(CreatePostAction(postData));
      store.dispatch(SetSelectedPostAction(const PostPayloadDTO()));
    };

    onEditPost = () {};
    userInfomation = store.state.userState;
    postData = AddPostRequestDTO()
      ..described = store.state.postState.selected.described
      // lấy bytes từ images, nếu ko có thì fetch từ url
      ..image = store.state.postState.selected.images
          .map((e) => e.bytes ?? Uint8List.fromList([]))
          .toList();
  }
}
