import 'dart:convert';

class Notifications{
  final String topic;
  final String message;

  Notifications({
    required this.topic,
    required this.message}
    );
  Map<String, dynamic> toMap() {
    return {
      'topic': topic,
      'message': message,

    };
  }
  factory Notifications.fromMap(Map<String, dynamic> map) {
    return Notifications(
      topic: map['topic'] ?? '',
      message: map['message'] ?? '',

    );
  }

  String toJson() => json.encode(toMap());

  factory Notifications.fromJson(String source) =>
      Notifications.fromMap(json.decode(source));
}


