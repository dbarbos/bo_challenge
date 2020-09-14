import 'message.dart';
import 'user.dart';

class NewsItem {
  User user;
  Message message;

  NewsItem({
    this.user,
    this.message,
  });

  factory NewsItem.fromMap(Map data) {
    return NewsItem(
      user: User.fromMap(data['user']),
      message: Message.fromMap(data['message']),
    );
  }
}
