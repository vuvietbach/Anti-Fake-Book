import 'dart:io';

import 'package:anti_fake_book/widgets/common/image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GeneralInfoEdit extends StatelessWidget {
  const GeneralInfoEdit({Key? key}) : super(key: key);

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
        title: const Text(
          "Chỉnh sửa thông tin",
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: const Column(children: [
        TextField(
          decoration: InputDecoration(
            labelText: 'Nơi làm việc',
          ),
        ),
        TextField(
          decoration: InputDecoration(
            labelText: 'Địa chỉ',
          ),
        ),
        TextField(
          decoration: InputDecoration(
            labelText: 'Quốc tịch',
          ),
        ),
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: double.infinity,
        height: 60.0,
        child: FloatingActionButton(
          onPressed: () {
            _showConfirmDialog(context);
          },
          child: const Text(
            "Cập nhập",
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }

  void _showConfirmDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Xác nhận"),
            content: const Text("Bạn có chắc chắn muốn cập nhập thông tin?"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Hủy")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Đồng ý")),
            ],
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
      floatingActionButton: SizedBox(
        width: double.infinity,
        height: 60.0,
        child: FloatingActionButton(
          onPressed: () {
            _showConfirmDialog(context);
          },
          child: const Text(
            "Cập nhập",
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }

  void _showConfirmDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Xác nhận"),
            content: const Text("Bạn có chắc chắn muốn cập nhập thông tin?"),
            actions: [
              TextButton(
                  onPressed: () {
                    onCancel?.call();
                    Navigator.pop(context);
                  },
                  child: const Text("Hủy")),
              TextButton(
                  onPressed: () {
                    onConfirm?.call();
                    Navigator.pop(context);
                  },
                  child: const Text("Đồng ý")),
            ],
          );
        });
  }
}

class EditDescription extends StatefulWidget {
  const EditDescription({super.key});

  @override
  State<EditDescription> createState() => _EditDescriptionState();
}

class _EditDescriptionState extends State<EditDescription> {
  String initialText = "Mô tả";
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = initialText;
  }

  @override
  Widget build(BuildContext context) {
    return EditPage(
      title: "Chỉnh sửa mô tả",
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: _controller,
          maxLines: 4,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Mô tả',
          ),
          onSaved: (value) {
            setState(() {
              initialText = value ?? "";
            });
          },
        ),
      ),
      onConfirm: () {
        setState(() {
          initialText = _controller.text;
        });
      },
      onCancel: () {
        setState(() {
          _controller.text = initialText;
        });
      },
    );
  }
}

class EditLink extends StatefulWidget {
  const EditLink({super.key});

  @override
  State<EditLink> createState() => _EditLinkState();
}

class _EditLinkState extends State<EditLink> {
  String initialText = "Mô tả";
  final _controller = TextEditingController();
  @override
  void initialState() {
    super.initState();
    _controller.text = initialText;
  }

  @override
  Widget build(BuildContext context) {
    return EditPage(
      title: "Chỉnh sửa liên kết",
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: _controller,
          maxLines: 4,
          decoration: const InputDecoration(
              labelText: 'Liên kết trang cá nhân',
              border: OutlineInputBorder()),
          onSaved: (value) {
            setState(() {
              initialText = value ?? "";
            });
          },
        ),
      ),
      onConfirm: () {
        setState(() {
          initialText = _controller.text;
        });
      },
      onCancel: () {
        setState(() {
          _controller.text = initialText;
        });
      },
    );
  }
}

class EditAvatar extends StatefulWidget {
  const EditAvatar({super.key});

  @override
  State<EditAvatar> createState() => _EditAvatarState();
}

class _EditAvatarState extends State<EditAvatar> {
  String? pickedFile;
  @override
  Widget build(BuildContext context) {
    return EditPage(
      title: "Chỉnh sửa ảnh đại diện",
      onConfirm: () {
        print(pickedFile ?? "null");
      },
      onCancel: () {
        pickedFile = null;
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60.0,
              backgroundImage: pickedFile != null ? FileImage(File(pickedFile!)) as ImageProvider: const AssetImage('assets/images/avatar.jpeg'),
            ),
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

class EditCoverImage extends StatefulWidget {
  const EditCoverImage({super.key});

  @override
  State<EditCoverImage> createState() => _EditCoverImageState();
}

class _EditCoverImageState extends State<EditCoverImage> {
  String? pickedFile;
  @override
  Widget build(BuildContext context) {
    return EditPage(
      title: "Chỉnh sửa ảnh đại diện",
      onCancel: () {
        pickedFile = null;
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CoverImage(
              image: (pickedFile != null) ? FileImage(File(pickedFile!)) as ImageProvider : const AssetImage('assets/images/background.jpeg'),
            ),
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

