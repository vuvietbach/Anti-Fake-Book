import 'package:anti_fake_book/constants/common/color_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';

import 'package:anti_fake_book/models/base_apis/dto/request/report_post.dto.dart';
import 'package:anti_fake_book/store/actions/index.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:anti_fake_book/widgets/common/oval_seclection.dart';

class ConfirmReportScreen extends StatelessWidget {
  final List<String> listSelectedReason;
  final String postId;
  const ConfirmReportScreen(
      {Key? key, required this.listSelectedReason, required this.postId})
      : super(key: key);
  final padding = const EdgeInsets.all(5.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: padding,
        child: StoreBuilder<AntiFakeBookState>(
          builder: (context, store) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // hình tròn màu cam, có hình chấm than ở giữa
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  ),
                  height: 50,
                  width: 50,
                  child: const Icon(
                    Icons.warning_amber_rounded,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                // text bạn đã chọn in đậm
                const Text(
                  'Bạn đã chọn: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                //list các OvalSelection được tạo ra từ listSelectedReason
                ...listSelectedReason.map(
                  (e) => OvalSelection(
                    onDisSelected: (String value) {},
                    onSelected: (String value) {},
                    label: e,
                    initIsSelected: true,
                    disable: true,
                  ),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            'Bạn có thể báo cáo nếu cho rằng nội dung này vi phạm ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: 'tiêu chuẩn cộng đồng',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      TextSpan(
                        text: ' của chúng tôi.',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                // nút xong dài toàn bộ màn hình
                // container có boder top màu xám, ko có màu
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  decoration: const BoxDecoration(
                    border: Border(top: BorderSide(color: Colors.grey)),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    final ReportPostRequestDto reportData =
                        ReportPostRequestDto(
                            id: postId,
                            subject: listSelectedReason,
                            details: 'details');
                    store.dispatch(ReportPostAction(reportData));
                    context.go('/');
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text('Xong'),
                ),
              ].map((e) => Padding(padding: padding, child: e)).toList(),
            );
          },
        ),
      ),
    );
  }
}
