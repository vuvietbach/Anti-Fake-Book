import 'package:anti_fake_book/global_type/list_button_config.dart';
import 'package:flutter/material.dart';

class ListButton extends StatelessWidget {
  final double width;
  final List<ListButtonItemConfig> listButtonConfig;
  ListButton(this.width, this.listButtonConfig, {super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: listButtonConfig.map<Widget>((ListButtonItemConfig e) {
          return Column(children: [
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: e.onPressed,
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.transparent,
              ),
              child: Container(
                width: width,
                alignment: AlignmentDirectional.center,
                child: Text(e.label),
              ),
            )
          ]);
        }).toList());
  }
}
