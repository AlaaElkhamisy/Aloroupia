import 'package:aloroupia/constants.dart';
import 'package:hive_flutter/adapters.dart';

part 'message_model.g.dart';

@HiveType(typeId: 1)
class Message {
  @HiveField(0)
  final String message;
  @HiveField(1)
  final String id;
  @HiveField(2)
  final String senderId;
  @HiveField(3)
  final String status;
  Message({
    required this.message,
    required this.id,
    required this.senderId,
    required this.status,
  });

  factory Message.fromJson(jsonData) {
    return Message(
      message: jsonData[kMessage] ?? '',
      id: jsonData['id'] ?? DateTime.now().millisecondsSinceEpoch.toString(),
      senderId: jsonData[kSenderId] ?? '',
      status: jsonData['status'] ?? 'sent',
    );
  }
}
