import 'dart:typed_data';

import 'package:hive/hive.dart';
part 'ai_messaging_model.g.dart';

@HiveType(typeId: 0)
class AiMessagingModel extends HiveObject {
  @HiveField(0)
  final String prompt;
  @HiveField(1)
  final Uint8List generatedImage;

  AiMessagingModel({required this.prompt, required this.generatedImage});

  // @override
  // String toString() {
  //   return 'AiMessagingModel(prompt: $prompt, response: $generatedImage)';
  // }
}
