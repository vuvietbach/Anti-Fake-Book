import 'package:anti_fake_book/global_type/list_button_config.dart';
import 'package:flutter/material.dart';

class ListButton extends StatelessWidget {
  final double width;
  final List<ListButtonItemConfig> listButtonConfig;
  const ListButton(this.width, this.listButtonConfig, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: listButtonConfig.map<Widget>((ListButtonItemConfig e) {
          return Container(
            width: width,
            //thêm kẻ trên kẻ dưới màu xám cho container, tăng padding lên 10
            decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey))),
            //thêm padding top và bottom là 10
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: ElevatedButton(
              onPressed: e.onPressed,
              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent,
                  backgroundColor: Colors.transparent),
              //Thêm thẻ chữ màu đen
              child: Row(
                //chữ vào giữa
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  if (e.icon != null)
                    Icon(IconData(e.icon!, fontFamily: 'MaterialIcons'),
                        color: Colors.black),
                  Text(
                    e.label,
                    style: const TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          );
        }).toList());
  }
}
