import 'dart:ffi';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AvatarImage extends StatefulWidget {
  final double height;
  final String? imageUrl;
  final String? localImagePath;
  final bool allowEdit;
  final Function(String?)? onImageChanged;

  const AvatarImage({
    super.key,
    this.imageUrl,
    this.height = 200.0,
    this.allowEdit = false,
    this.onImageChanged,
    this.localImagePath,
  });

  @override
  State<AvatarImage> createState() => _AvatarImageState();
}

class _AvatarImageState extends State<AvatarImage> {
  String? imagePath;
  _decorationImage() {
    try {
      if (widget.allowEdit && imagePath != null) {
        return DecorationImage(
          image: FileImage(File(imagePath!)),
          fit: BoxFit.cover,
        );
      } else if (widget.imageUrl != null && widget.imageUrl!.isNotEmpty) {
        return DecorationImage(
          image: NetworkImage(widget.imageUrl!),
          fit: BoxFit.cover,
        );
      } else if (widget.localImagePath != null &&
          widget.localImagePath!.isNotEmpty) {
        return DecorationImage(
          image: FileImage(File(widget.localImagePath!)),
          fit: BoxFit.cover,
        );
      } else {
        throw Exception();
      }
    } catch (e) {
      return const DecorationImage(
        image: AssetImage('assets/images/default_avatar.jpeg'),
        fit: BoxFit.cover,
      );
    }
  }

  Future _pickImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      imagePath = pickedFile?.path;
    });
    widget.onImageChanged?.call(pickedFile?.path);
  }

  Future _pickImageFromCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      imagePath = pickedFile?.path;
    });
    widget.onImageChanged?.call(pickedFile?.path);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: widget.height,
            width: widget.height,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: _decorationImage(),
            )),
        widget.allowEdit ? _editButton(context) : const SizedBox(),
      ],
    );
  }

  Positioned _editButton(BuildContext context) {
    return Positioned(
      bottom: -5,
      right: -5,
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) => SizedBox(
                        height: 300.0,
                        child: Column(
                          children: [
                            ListTile(
                              leading: const Icon(Icons.camera),
                              title: const Text("Chụp ảnh"),
                              onTap: _pickImageFromCamera,
                            ),
                            ListTile(
                              leading: const Icon(Icons.photo),
                              title: const Text("Chọn ảnh trong máy"),
                              onTap: _pickImageFromGallery,
                            ),
                          ],
                        ),
                      ));
            },
            icon: const Icon(
              Icons.add_a_photo,
              color: Colors.black,
            )),
      ),
    );
  }
}

class CoverImage extends StatefulWidget {
  final double height;
  final String? imageUrl;
  final bool allowEdit;

  const CoverImage({
    super.key,
    this.imageUrl,
    this.height = 200.0,
    this.allowEdit = false,
  });

  @override
  State<CoverImage> createState() => _CoverImageState();
}

class _CoverImageState extends State<CoverImage> {
  String? imagePath;
  _decorationImage() {
    if (widget.allowEdit && imagePath != null) {
      return DecorationImage(
        image: FileImage(File(imagePath!)),
        fit: BoxFit.cover,
      );
    } else if (widget.imageUrl != null && widget.imageUrl!.isNotEmpty) {
      return DecorationImage(
        image: NetworkImage(widget.imageUrl!),
        fit: BoxFit.cover,
      );
    } else {
      return null;
    }
  }

  Future _pickImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      imagePath = pickedFile?.path;
    });
  }

  Future _pickImageFromCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      imagePath = pickedFile?.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: widget.height,
          decoration: BoxDecoration(
            image: _decorationImage(),
            color: Colors.grey,
          ),
        ),
        widget.allowEdit ? _editButton(context) : const SizedBox(),
      ],
    );
  }

  Positioned _editButton(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[200],
        ),
        child: IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) => SizedBox(
                        height: 300.0,
                        child: Column(
                          children: [
                            ListTile(
                              leading: const Icon(Icons.camera),
                              title: const Text("Chụp ảnh"),
                              onTap: _pickImageFromCamera,
                            ),
                            ListTile(
                              leading: const Icon(Icons.photo),
                              title: const Text("Chọn ảnh trong máy"),
                              onTap: _pickImageFromGallery,
                            ),
                          ],
                        ),
                      ));
            },
            icon: const Icon(
              Icons.add_a_photo,
              color: Colors.black,
            )),
      ),
    );
  }
}
