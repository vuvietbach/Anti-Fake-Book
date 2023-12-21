import 'package:flutter/material.dart';

class CommonListTileContent {
  final Icon icon;
  final String title;
  final String description;
  final String key;
  CommonListTileContent(
      {required this.icon,
      required this.title,
      required this.key,
      this.description = 'Thông báo đẩy'});
}

class CommonListTitle extends StatefulWidget {
  final CommonListTileContent content;
  final Function? onChanged;
  final bool initValue;
  const CommonListTitle(
      {Key? key, required this.content, this.onChanged, this.initValue = false})
      : super(key: key);

  @override
  _ListTitleState createState() => _ListTitleState();
}

class _ListTitleState extends State<CommonListTitle> {
  bool isSwitched = false;
  @override
  void initState() {
    super.initState();
    isSwitched = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: widget.content.icon,
      title: Text(widget.content.title),
      subtitle: Text(widget.content.description),
      trailing: Switch(
        value: isSwitched,
        onChanged: (value) {
          setState(() {
            isSwitched = value;
          });
          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
        },
      ),
    );
  }
}
