import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
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
  String? _imagePath;
  // _decorationImage() {
  //   try {
  //     if (widget.allowEdit && imagePath != null) {
  //       return DecorationImage(
  //         image: FileImage(File(imagePath!)),
  //         fit: BoxFit.cover,
  //       );
  //     } else if (widget.imageUrl != null && widget.imageUrl!.isNotEmpty) {
  //       return DecorationImage(
  //         image: NetworkImage(widget.imageUrl!),
  //         fit: BoxFit.cover,
  //       );
  //     } else if (widget.localImagePath != null &&
  //         widget.localImagePath!.isNotEmpty) {
  //       return DecorationImage(
  //         image: FileImage(File(widget.localImagePath!)),
  //         fit: BoxFit.cover,
  //       );
  //     } else {
  //       throw Exception();
  //     }
  //   } catch (e) {
  //     return const DecorationImage(
  //       image: AssetImage('assets/images/default_avatar.jpeg'),
  //       fit: BoxFit.cover,
  //     );
  //   }
  // }

  Widget _avatar() {
    final defaultAvatar = CircleAvatar(
        radius: widget.height / 2,
        backgroundImage: const AssetImage('assets/images/default_avatar.jpeg'));
    final localPath = _imagePath ?? widget.localImagePath;
    return localPath != null
        ? CircleAvatar(
            radius: widget.height / 2,
            backgroundImage: FileImage(File(localPath)))
        : widget.imageUrl != null && widget.imageUrl!.isNotEmpty
            ? CachedNetworkImage(
                imageUrl: widget.imageUrl!,
                imageBuilder: (context, imageProvider) => CircleAvatar(
                  radius: widget.height / 2,
                  backgroundImage: imageProvider,
                ),
                placeholder: (context, url) => defaultAvatar,
                errorWidget: (context, url, error) => defaultAvatar,
              )
            : defaultAvatar;
  }

  Future _pickImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _imagePath = pickedFile?.path;
    });
    widget.onImageChanged?.call(pickedFile?.path);
  }

  Future _pickImageFromCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _imagePath = pickedFile?.path;
    });
    widget.onImageChanged?.call(pickedFile?.path);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Container(
        //     height: widget.height,
        //     width: widget.height,
        //     decoration: BoxDecoration(
        //       shape: BoxShape.circle,
        //       image: _decorationImage(),
        //     )),
        _avatar(),
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
  final String? imageUrl;
  final bool allowEdit;
  final double? height;
  final double? width;
  final String? localImagePath;
  final Function(String?)? onImageChanged;

  const CoverImage({
    super.key,
    this.imageUrl,
    this.width,
    this.height,
    // this.height = 200.0,
    this.allowEdit = false,
    this.onImageChanged,
    this.localImagePath,
  });

  @override
  State<CoverImage> createState() => _CoverImageState();
}

class _CoverImageState extends State<CoverImage> {
  String? _imagePath;
  // _decorationImage() {
  //   if (widget.allowEdit && imagePath != null) {
  //     return DecorationImage(
  //       image: FileImage(File(imagePath!)),
  //       fit: BoxFit.cover,
  //     );
  //   } else if (widget.imageUrl != null && widget.imageUrl!.isNotEmpty) {
  //     return DecorationImage(
  //       image: NetworkImage(widget.imageUrl!),
  //       fit: BoxFit.cover,
  //     );
  //   } else {
  //     return null;
  //   }
  // }
  Widget _coverImage() {
    final defaultImage = Container(
      width: widget.width,
      height: widget.height,
      color: Colors.grey,
    );
    final localPath = _imagePath ?? widget.localImagePath;
    return localPath != null
        ? Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: FileImage(File(localPath)),
                fit: BoxFit.cover,
              ),
            ))
        : widget.imageUrl != null && widget.imageUrl!.isNotEmpty
            ? CachedNetworkImage(
                imageUrl: widget.imageUrl!,
                imageBuilder: (context, imageProvider) => Container(
                  width: widget.width,
                  height: widget.height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => defaultImage,
                errorWidget: (context, url, error) => defaultImage,
              )
            : defaultImage;
  }

  Future _pickImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _imagePath = pickedFile?.path;
    });
  }

  Future _pickImageFromCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _imagePath = pickedFile?.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Container(
        //   height: widget.height,
        //   decoration: BoxDecoration(
        //     image: _decorationImage(),
        //     color: Colors.grey,
        //   ),
        // ),
        _coverImage(),
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
