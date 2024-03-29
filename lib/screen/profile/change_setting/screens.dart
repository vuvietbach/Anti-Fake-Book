import 'dart:io';

import 'package:anti_fake_book/constants/constants.dart';
import 'package:anti_fake_book/helper/helper.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/index.dart';
import 'package:anti_fake_book/screen/profile/change_setting/redux_actions.dart';
import 'package:anti_fake_book/screen/profile/widgets.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:anti_fake_book/store/state/user_info.dart';
import 'package:anti_fake_book/utils.dart';
import 'package:anti_fake_book/widgets/common/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:image_picker/image_picker.dart';
import 'package:redux/redux.dart';

class EditSection extends StatelessWidget {
  final String sectionName;
  final Widget? child;
  final Function? onEdit;
  const EditSection(
      {super.key, required this.sectionName, this.child, this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          EditSectionHeading(
            sectionName: sectionName,
            onEdit: onEdit,
          ),
          child ?? Container()
        ],
      ),
    );
  }
}

class EditSectionHeading extends StatelessWidget {
  final Function? onEdit;
  const EditSectionHeading({
    super.key,
    required this.sectionName,
    this.onEdit,
  });

  final String sectionName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          sectionName,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            onEdit?.call();
          },
          child: const Text(
            "Chỉnh sửa",
            style: TextStyle(color: Colors.blue),
          ),
        )
      ],
    );
  }
}

class EditBackgroundSection extends StatelessWidget {
  const EditBackgroundSection({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreBuilder(
        builder: (BuildContext context, Store<AntiFakeBookState> store) {
      print(store.state.userState.userInfo.coverImage);
      return EditSection(
        onEdit: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const EditBackgroundPage(),
          ),
        ),
        sectionName: "Ảnh bìa",
        child: BackgroundImage(
            height: 200.0, imageUrl: store.state.userState.userInfo.coverImage),
      );
    });
  }
}

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreBuilder(
        builder: (BuildContext context, Store<AntiFakeBookState> store) {
      return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          store.state.userState.userInfo.description,
          style: const TextStyle(fontSize: 15.0),
        ),
      );
    });
  }
}

class LinkSection extends StatelessWidget {
  const LinkSection({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreBuilder(
        builder: (BuildContext context, Store<AntiFakeBookState> store) {
      return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          store.state.userState.userInfo.link,
          style: const TextStyle(color: Colors.blue),
        ),
      );
    });
  }
}

class EditAvatarSection extends StatelessWidget {
  const EditAvatarSection({super.key});
  @override
  Widget build(BuildContext context) {
    return StoreBuilder(
        builder: (BuildContext context, Store<AntiFakeBookState> store) {
      return EditSection(
          sectionName: "Ảnh đại diện",
          onEdit: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const EditAvatarPage(),
                ),
              ),
          child: AvatarImage(
            height: 130.0,
            imageUrl: store.state.userState.userInfo.avatar,
          ));
    });
  }
}

class EditGeneralInfoPage extends StatefulWidget {
  const EditGeneralInfoPage({Key? key}) : super(key: key);

  @override
  State<EditGeneralInfoPage> createState() => _EditGeneralInfoPageState();
}

class _EditGeneralInfoPageState extends State<EditGeneralInfoPage> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StoreBuilder(onInit: (Store<AntiFakeBookState> store) {
      UserInfo userInfo = store.state.userState.userInfo;
      _controller1.text = userInfo.city;
      _controller2.text = userInfo.address;
      _controller3.text = userInfo.country;
    }, builder: (BuildContext context, Store<AntiFakeBookState> store) {
      return EditPage(
        title: "Chỉnh sửa thông tin",
        child: Column(children: [
          TextField(
            decoration: const InputDecoration(
              labelText: 'Nơi làm việc',
            ),
            controller: _controller1,
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Địa chỉ',
            ),
            controller: _controller2,
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Quốc tịch',
            ),
            controller: _controller3,
          ),
        ]),
        onCancel: () {
          setState(() {
            UserInfo userInfo = store.state.userState.userInfo;
            _controller1.text = userInfo.city;
            _controller2.text = userInfo.address;
            _controller3.text = userInfo.country;
          });
        },
        onConfirm: () {
          setUserInfo(
              context,
              SetUserInfoRequest(
                  city: _controller1.text,
                  address: _controller2.text,
                  country: _controller3.text));
        },
      );
    });
  }
}

class EditPage extends StatelessWidget {
  final String? title;
  final Widget? child;
  final Function? onConfirm;
  final Function? onCancel;
  const EditPage(
      {super.key, this.title, this.child, this.onConfirm, this.onCancel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(color: Colors.black, Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Quay lại màn hình trước đó
          },
        ),
        title: Text(
          title ?? "Chỉnh sửa thông tin",
          style: const TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: child,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          width: double.infinity,
          height: 40.0,
          child: ElevatedButton(
            onPressed: () async {
              bool confirm = await _showConfirmDialog(context);
              if (confirm) {
                onConfirm?.call();
              } else {
                onCancel?.call();
              }
            },
            child: const Text(
              "Cập nhập",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _showConfirmDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Xác nhận"),
            content: const Text("Bạn có chắc chắn muốn cập nhập thông tin?"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text("Hủy")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: const Text("Đồng ý")),
            ],
          );
        });
  }
}

class EditDescriptionPage extends StatefulWidget {
  const EditDescriptionPage({super.key});

  @override
  State<EditDescriptionPage> createState() => _EditDescriptionPageState();
}

class _EditDescriptionPageState extends State<EditDescriptionPage> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder(onInit: (Store<AntiFakeBookState> store) {
      _controller.text = store.state.userState.userInfo.description;
    }, builder: (BuildContext context, Store<AntiFakeBookState> store) {
      return EditPage(
        title: "Chỉnh sửa mô tả",
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _controller,
            maxLines: null,
            decoration: const InputDecoration(border: InputBorder.none),
          ),
        ),
        onConfirm: () {
          setUserInfo(
            context,
            SetUserInfoRequest(description: _controller.text),
            // onSuccess: (res) => Navigator.pop(context),
          );
        },
        onCancel: () {
          setState(() {
            _controller.text = store.state.userState.userInfo.description;
          });
        },
      );
    });
  }
}

class EditLink extends StatefulWidget {
  const EditLink({super.key});

  @override
  State<EditLink> createState() => _EditLinkState();
}

class _EditLinkState extends State<EditLink> {
  final _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder(onInit: (Store<AntiFakeBookState> store) {
      _controller.text = store.state.userState.userInfo.link;
    }, builder: (BuildContext context, Store<AntiFakeBookState> store) {
      return EditPage(
        title: "Chỉnh sửa liên kết",
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration(border: InputBorder.none),
          ),
        ),
        onConfirm: () {
          // setState(() {
          //   initialText = _controller.text;
          // });
          setUserInfo(
            context,
            SetUserInfoRequest(link: _controller.text),
            // onSuccess: (res) => Navigator.pop(context),
          );
        },
        onCancel: () {
          setState(() {
            _controller.text = store.state.userState.userInfo.link;
          });
        },
      );
    });
  }
}

class EditAvatarPage extends StatefulWidget {
  const EditAvatarPage({super.key});

  @override
  State<EditAvatarPage> createState() => _EditAvatarPageState();
}

class _EditAvatarPageState extends State<EditAvatarPage> {
  String? pickedFile;
  @override
  Widget build(BuildContext context) {
    return StoreBuilder(
        builder: (BuildContext context, Store<AntiFakeBookState> store) {
      return EditPage(
        title: "Chỉnh sửa ảnh đại diện",
        onConfirm: () {
          if (pickedFile != null) {
            setUserInfo(context, SetUserInfoRequest(avatar: pickedFile));
          }
        },
        onCancel: () {
          setState(() {
            pickedFile = null;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _avatar(store.state.userState.userInfo.avatar),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _showOptions(context),
                  child: const Text(
                    "Thay đổi ảnh đại diện",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  Widget _avatar(String imageUrl) {
    return pickedFile != null
        ? AvatarImage(height: 130.0, localImagePath: pickedFile!)
        : AvatarImage(
            height: 130.0,
            imageUrl: imageUrl,
          );
  }

  Future _pickImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      this.pickedFile = pickedFile?.path;
    });
  }

  Future _pickImageFromCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      this.pickedFile = pickedFile?.path;
    });
  }

  void _showOptions(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => SizedBox(
              height: 300.0,
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.photo),
                    title: const Text("Chụp ảnh"),
                    onTap: _pickImageFromCamera,
                  ),
                  ListTile(
                    leading: const Icon(Icons.upload),
                    title: const Text("Tải ảnh từ máy"),
                    onTap: _pickImageFromGallery,
                  ),
                ],
              ),
            ));
  }
}

class EditBackgroundPage extends StatefulWidget {
  const EditBackgroundPage({super.key});

  @override
  State<EditBackgroundPage> createState() => _EditBackgroundPageState();
}

class _EditBackgroundPageState extends State<EditBackgroundPage> {
  String? pickedFile;
  Widget _backgroundImage(String? imageUrl) {
    if (pickedFile != null) {
      return BackgroundImage(
        height: 200.0,
        imagePath: pickedFile,
      );
    }
    return BackgroundImage(
      height: 200.0,
      imageUrl: imageUrl,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder(
        builder: (BuildContext context, Store<AntiFakeBookState> store) {
      return EditPage(
        title: "Chỉnh sửa ảnh bìa",
        onConfirm: () {
          if (pickedFile != null) {
            setUserInfo(context, SetUserInfoRequest(coverImage: pickedFile));
          }
        },
        onCancel: () {
          setState(() {
            pickedFile = null;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _backgroundImage(store.state.userState.userInfo.coverImage),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _showOptions(context),
                  child: const Text(
                    "Thay đổi ảnh bìa",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  Future _pickImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      this.pickedFile = pickedFile?.path;
    });
  }

  Future _pickImageFromCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      this.pickedFile = pickedFile?.path;
    });
  }

  void _showOptions(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => SizedBox(
              height: 300.0,
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.photo),
                    title: const Text("Chụp ảnh"),
                    onTap: _pickImageFromCamera,
                  ),
                  ListTile(
                    leading: const Icon(Icons.upload),
                    title: const Text("Tải ảnh từ máy"),
                    onTap: _pickImageFromGallery,
                  ),
                ],
              ),
            ));
  }
}

class EditDescriptionSection extends StatelessWidget {
  const EditDescriptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return EditSection(
      sectionName: "Tiểu sử",
      onEdit: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const EditDescriptionPage(),
        ),
      ),
      child: const DescriptionSection(),
    );
  }
}

class EditGeneralInfoSection extends StatelessWidget {
  const EditGeneralInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return EditSection(
      sectionName: "Chi tiết",
      onEdit: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const EditGeneralInfoPage(),
        ),
      ),
      child: StoreBuilder(
          builder: (BuildContext context, Store<AntiFakeBookState> store) {
        UserInfo userInfo = store.state.userState.userInfo;
        return GeneralInfoSection(
          city: userInfo.city,
          address: userInfo.address,
          country: userInfo.country,
        );
      }),
    );
  }
}

class EditAccountLinkSection extends StatelessWidget {
  const EditAccountLinkSection({super.key});

  @override
  Widget build(BuildContext context) {
    return EditSection(
      sectionName: "Liên kết",
      onEdit: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const EditLink(),
        ),
      ),
      child: const LinkSection(),
    );
  }
}

class EditUsernameSection extends StatelessWidget {
  const EditUsernameSection({super.key});

  @override
  Widget build(BuildContext context) {
    return EditSection(
      sectionName: "Tên người dùng",
      onEdit: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const EditUsernamePage(),
        ),
      ),
      child: StoreBuilder(
          builder: (BuildContext context, Store<AntiFakeBookState> store) {
        return Align(
          alignment: Alignment.centerLeft,
          child: Text(
            store.state.userState.userInfo.username,
            style: const TextStyle(fontSize: 15.0),
          ),
        );
      }),
    );
  }
}

class EditUsernamePage extends StatefulWidget {
  const EditUsernamePage({super.key});

  @override
  State<EditUsernamePage> createState() => _EditUsernamePageState();
}

class _EditUsernamePageState extends State<EditUsernamePage> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder(onInit: (Store<AntiFakeBookState> store) {
      _controller.text = store.state.userState.userInfo.username;
    }, builder: (BuildContext context, Store<AntiFakeBookState> store) {
      return EditPage(
        title: "Chỉnh sửa tên người dùng",
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            maxLines: 1,
            maxLength: MAX_USERNAME_LENGTH,
            controller: _controller,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            style: const TextStyle(fontSize: 15.0),
          ),
        ),
        onConfirm: () => _onConfirm(
            context, _controller.text, store.state.userState.userInfo.email),
        onCancel: () => _onCancel(store.state.userState.userInfo.username),
      );
    });
  }

  void _onConfirm(BuildContext context, String username, String email) {
    if (validateUsername(username, email)) {
      setUserInfo(context, SetUserInfoRequest(username: _controller.text));
    } else {
      showUsernameErrorDialog(context);
    }
  }

  void _onCancel(String username) {
    setState(() {
      _controller.text = username;
    });
  }
}
