import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDropdownMenu extends StatefulWidget {
  final Icon? icon;
  final String title;
  final List<Widget> children;
  final Function()? onPressed;
  final bool isShowLeading;
  final Color backgroundColor;
  final double childPadding;
  AppDropdownMenu(
      {Key? key,
      this.icon,
      required this.title,
      this.children = const [],
      this.isShowLeading = true,
      this.childPadding = 0,
      this.backgroundColor = const Color.fromRGBO(207, 216, 220, 1),
      this.onPressed})
      : super(key: key);
  @override
  _DropdownMenuState createState() => _DropdownMenuState();
}

class _DropdownMenuState extends State<AppDropdownMenu> {
  bool isShow = false;
  // khởi tạo isShow = widget.isShowLeading lần đầu tạo ra state
  @override
  void initState() {
    super.initState();
    isShow = !widget.isShowLeading;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: widget.backgroundColor,
      ),
      child: Wrap(
        children: [
          ElevatedButton(
              // ko có màu nền, khi nhấn thì có đường màu đen chạy
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                  elevation: MaterialStateProperty.all(0)),
              onPressed: () {
                if (widget.isShowLeading) {
                  setState(() {
                    isShow = !isShow;
                  });
                }
                if (widget.onPressed != null) widget.onPressed!();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (widget.icon != null) widget.icon!,
                      if (widget.icon != null) const SizedBox(width: 10),
                      Text(widget.title,
                          style: const TextStyle(color: Colors.black)),
                    ],
                  ),
                  if (widget.isShowLeading)
                    Icon(
                        !isShow
                            ? CupertinoIcons.chevron_down
                            : CupertinoIcons.chevron_up,
                        color: Colors.black)
                ],
              )),
          if (isShow)
            Padding(
              padding: EdgeInsets.only(left: widget.childPadding),
              child: Column(
                children: widget.children,
              ),
            )
        ],
      ),
    );
  }
}
