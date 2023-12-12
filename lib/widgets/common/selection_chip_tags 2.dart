import 'package:flutter/material.dart';

class ChipTags extends StatefulWidget {
  final Map<String, dynamic> list;
  final bool enableSearch;
  final double textSize;
  const ChipTags(
      {super.key,
      required this.list,
      this.enableSearch = false,
      this.textSize = 8});

  @override
  State<ChipTags> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<ChipTags> {
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.list.keys.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.textSize * 3,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(4)),
        child: DropdownButton<String>(
          value: dropdownValue,
          icon: Icon(
            Icons.arrow_drop_down_outlined,
            size: widget.textSize,
          ),
          underline: Container(
            height: 0,
          ),
          items: widget.list.entries.map((entry) {
            final value = entry.value;
            return DropdownMenuItem<String>(
              value: entry.key,
              child: Row(
                children: <Widget>[
                  Icon(
                    IconData(value['leadingIcon'], fontFamily: 'MaterialIcons'),
                    size: widget.textSize,
                  ),
                  Text(
                    value['label'],
                    style: TextStyle(
                        fontSize: widget.textSize, color: Colors.grey),
                  ),
                ],
              ),
            );
          }).toList(),
          itemHeight: 48,
          onChanged: (String? newValue) {
            dropdownValue = newValue!;
          },
        ));
  }
}
