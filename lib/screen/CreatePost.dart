import 'package:flutter/material.dart';

class Post {
  final String username;
  final String content;
  final String imageUrl;

  Post({required this.username, required this.content, required this.imageUrl});
}

class UserInfo {
  final String name;
  final String avatarUrl;

  UserInfo({required this.name, required this.avatarUrl});
}

class CreatePostScreen extends StatefulWidget {
  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  String content = '';
  String imageUrl = '';

  UserInfo userInfo = UserInfo(
    name: 'Nguyễn Minh Tuấn',
    avatarUrl: 'https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đăng bài'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Quay lại màn hình trước đó
          },
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              // Xử lý đăng bài
              Post newPost = Post(
                username: userInfo.name,
                content: content,
                imageUrl: imageUrl,
              );
              // Gửi newPost đến server hoặc lưu vào cơ sở dữ liệu
              // ...
              // Sau khi đăng bài thành công, chuyển về trang chủ hoặc trang xem bài viết
              Navigator.pop(context);
            },
            child: Text('Đăng bài'),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(userInfo.avatarUrl),
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          userInfo.name,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Nội dung',
                      ),
                      maxLines: null,
                      onChanged: (value) {
                        setState(() {
                          content = value;
                        });
                      },
                    ),
                    SizedBox(height: 16.0),
                    // TextField(
                    //   decoration: InputDecoration(
                    //     labelText: 'URL hình ảnh',
                    //   ),
                    //   onChanged: (value) {
                    //     setState(() {
                    //       imageUrl = value;
                    //     });
                    //   },
                    // ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            // color: Colors.grey[200],
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Thực hiện hành động để lấy ảnh từ điện thoại
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.grey[200],
                shadowColor: Colors.transparent,
              ),
              child: Text(
                'Lấy ảnh',
                style: TextStyle(
                  color: Colors.black, // Đặt màu chữ thành màu đen
                ),),
            ),
          ),
        ],
      ),
    );
  }
}
