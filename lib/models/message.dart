class Message {
  String content;
  DateTime createdAt;

  Message({
    this.content,
    this.createdAt,
  });

  factory Message.fromMap(Map data) {
    return Message(
      content: data['content'],
      createdAt: DateTime.parse(data['created_at']),
    );
  }
}
