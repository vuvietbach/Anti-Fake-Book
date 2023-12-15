import 'package:anti_fake_book/screen/posts/report_post/report_post.dart';
import 'package:anti_fake_book/widgets/common/oval_seclection.dart';
import 'package:flutter/material.dart';

class ListOvalChoice extends StatelessWidget {
  final List<String> labels;
  const ListOvalChoice({super.key, required this.labels});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.0, // space between items
      runSpacing: 10.0, // space between lines
      children: labels
          .map<OvalSelection>((e) => OvalSelection(
                label: e,
                onDisSelected: (String item) {
                  ReportPostScreenWidget.of(context).onRemoveItem(item);
                },
                onSelected: (String item) {
                  ReportPostScreenWidget.of(context).onAddItem(item);
                },
              ))
          .toList(),
    );
  }
}
