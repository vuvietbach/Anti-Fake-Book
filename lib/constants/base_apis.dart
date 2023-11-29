abstract class PathName {
  static String addPost = '/add_post';
  static String getPost = '/get_post';
  static String editPost = '/edit_post';
  static String deletePost = '/delete_post';
  static String reportPost = '/report_post';
  static String getMarkComment = '/get_mark_comment';
  static String setMarkComment = '/set_mark_comment';
  static String deleteComment = '/delete_comment';
  static String feelPost = '/feel';
  static String setPushSettings = '/set_push_settings';
  static String changePassword = '/change_password';
  static String checkNewVersion = '/check_new_version';
  static String getPushSettings = '/get_push_settings';
  static String setBlock = '/set_block';
  static String getNotification = '/get_notification';
  static String getUserInfo = '/get_user_info'; // da xong
  static String signIn = '/login'; // da xong
  static String signUp = '/signup'; // da xong nhung chi tiet phan data
  static String logOut = '/logout';
  static String getVerifyCode = '/get_verify_code'; // da xong
  static String checkVerifyCode = '/check_verify_code'; // da xong
  static String changeInfoAfterSignUp = '/change_info_after_signup'; // can kiem tra lai
  
  // tuanf 6
  static String search = '/search'; // lien quan den phan cua Quang
  static String getSavedSearch = '/get_saved_search'; // da xong
  static String delSavedSearch = '/del_saved_search'; // da xong
  // Tuan 10
  static String setReadNotification = '/set_read_notification'; // chua xong, chua hieu cong nghe
  static String setDevToken = '/set_devtoken'; // da xong, nhung ma lam the nao de moi khi khoi dong lai thi gui
  static String setUserInfo = '/set_user_info'; // da xong
  // Tuan 11
  static String getListConversation = '/get_list_conversation'; // da xong 
  static String getConversation = '/get_conversation'; // da xong
  static String setReadMessage = '/set_read_message'; // chua xong nhung truong data la gi
  static String deleteMessage = '/delete_message'; // da xong, nhung lieu co truong data
  static String deleteConversation = '/delete_conversation'; // 
}
