class PostStatus {
  String name;
  int icon;
  PostStatus(this.icon, this.name);
  static List<PostStatus> getEmotionList() {
    return <PostStatus>[
      PostStatus(0xe57d, 'Hạnh phúc'),
      PostStatus(0xe578, 'Có phúc'),
      PostStatus(0xe57c, 'Loved'),
      PostStatus(0xe814, 'Buồn'),
      PostStatus(0xe578, 'Biết ơn'),
      PostStatus(0xe813, 'Hào hứng'),
      PostStatus(0xe812, 'Đang yêu'),
    ];
  }

  static List<PostStatus> getActivityList() {
    return <PostStatus>[
      PostStatus(0xe57d, 'Đang chúc mừng'),
      PostStatus(0xe578, 'Đang xem'),
      PostStatus(0xe57c, 'Đang ăn'),
      PostStatus(0xe814, 'Đăng uống'),
    ];
  }
}
