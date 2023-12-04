import 'package:flutter/material.dart';

class OvalSelection extends StatefulWidget {
  final String? label;
  final String? title;
  final Icon? leddingIcon;
  final Function(String label)? onSelected;
  final Function(String label)? onDisSelected;
  final bool disable;
  final bool initIsSelected;
  const OvalSelection(
      {Key? key,
      this.label = '',
      this.leddingIcon,
      this.title,
      this.initIsSelected = false,
      this.disable = false,
      this.onDisSelected,
      this.onSelected})
      : super(key: key);
  @override
  _OvalSelectionState createState() =>
      _OvalSelectionState(isSelected: initIsSelected);
}

class _OvalSelectionState extends State<OvalSelection> {
  _OvalSelectionState({required this.isSelected});
  bool isSelected;
  bool isError = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!widget.disable) {
          setState(() {
            isSelected = !isSelected;
          });
        }
        if (widget.onSelected != null && isSelected) {
          widget.onSelected!(widget.label!);
        }
        if (widget.onDisSelected != null && !isSelected) {
          widget.onDisSelected!(widget.label!);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            color: isSelected ? Colors.lightBlue : Colors.grey[300],
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                color: isError ? Colors.red : Colors.transparent, width: 1)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.title != null)
              Text(widget.title!,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
            Wrap(
              children: [
                if (isSelected) const Icon(Icons.check, color: Colors.white),
                if (widget.label != null)
                  Text(widget.label!,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                      )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
