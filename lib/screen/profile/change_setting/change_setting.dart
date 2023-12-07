import 'package:anti_fake_book/models/base_apis/dto/response/index.dart';
import 'package:anti_fake_book/screen/profile/screens.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:anti_fake_book/widgets/common/divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:image_picker/image_picker.dart';
import 'package:redux/redux.dart';

class ChangeSettingPage extends StatelessWidget {
  const ChangeSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Chỉnh sửa trang cá nhân'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView(
          children: [
            const AvatarSection(),
            const Divider(
              height: 2.0,
            ),
            const BackgroundSection(),
            const Divider(
              height: 2.0,
            ),
            Section(
                sectionName: "Tiểu sử",
                child: const DescriptionSection(),
                onEdit: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditDescription()));
                }),
            const Divider(
              height: 2.0,
            ),
            Section(
              sectionName: "Chi tiết",
              child: const GeneralInfoSection(),
              onEdit: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GeneralInfoEdit()));
              },
            ),
            const Divider(
              height: 2.0,
            ),
            Section(
              sectionName: "Liên kết",
              child: const LinkSection(),
              onEdit: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const EditLink()));
              },
            ),
          ],
        ));
  }
}

class AvatarSection extends StatelessWidget {
  const AvatarSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Section(
      sectionName: "Ảnh đại diện",
      onEdit: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const EditAvatar(),
        ),
      ),
      child: const CircleAvatar(
        radius: 70,
        backgroundImage: AssetImage('assets/images/avatar.jpeg'),
      ),
    );
  }


}

class Section extends StatelessWidget {
  final String sectionName;
  final Widget? child;
  final Function? onEdit;
  const Section(
      {super.key, required this.sectionName, this.child, this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SectionHeading(
            sectionName: sectionName,
            onEdit: onEdit,
          ),
          child ?? Container()
        ],
      ),
    );
  }
}

class SectionHeading extends StatelessWidget {
  final Function? onEdit;
  const SectionHeading({
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

class BackgroundSection extends StatelessWidget {
  const BackgroundSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Section(
      onEdit: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const EditCoverImage(),
        ),
      ),
      sectionName: "Ảnh bìa",
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: const DecorationImage(
            image: AssetImage('assets/images/background.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "Tôi là một người rất thích chụp ảnh",
        style: TextStyle(fontSize: 15.0),
      ),
    );
  }
}

class GeneralInfoSection extends StatelessWidget {
  const GeneralInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreBuilder(
        builder: (BuildContext context, Store<AntiFakeBookState> store) {
      UserInfoData userInfo = store.state.userState.searchedUserInfo;
      return Column(
        children: [
          _item(Icons.work, "Làm việc tại", userInfo.city),
          _item(Icons.house, "Sống tại", userInfo.address),
          _item(Icons.location_on, "Đến từ", userInfo.country)
        ],
      );
    });
  }

  Widget _item(IconData icon, String text, String mainInfo) => Padding(
        padding: const EdgeInsets.only(bottom: 5.0),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(
              width: 10.0,
            ),
            RichText(
                text: TextSpan(
                    text: text,
                    style: const TextStyle(color: Colors.black),
                    children: [
                  const TextSpan(
                    text: " ",
                  ),
                  TextSpan(
                      text: mainInfo,
                      style: const TextStyle(fontWeight: FontWeight.bold))
                ]))
          ],
        ),
      );
}

class LinkSection extends StatelessWidget {
  const LinkSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "https://www.facebook.com/bach.nguyen.921677",
        style: TextStyle(color: Colors.blue),
      ),
    );
  }
}
