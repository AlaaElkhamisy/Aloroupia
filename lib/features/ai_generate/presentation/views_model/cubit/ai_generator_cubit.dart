import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:aloroupia/constants.dart';
import 'package:aloroupia/core/manager/colors/app_colors.dart';
import 'package:aloroupia/core/manager/functions/custom_toast.dart';
import 'package:aloroupia/features/ai_generate/data/ai_messaging_model.dart';
import 'package:aloroupia/generated/l10n.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart' as http;

import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

part 'ai_chat_state.dart';

class AiChatCubit extends Cubit<AiChatState> {
  AiChatCubit() : super(AiChatInitial());

  static const String _baseUrl = 'https://image.pollinations.ai/prompt/';
  final TextEditingController promptController = TextEditingController();
  Uint8List? _generatedImage;

  Future<void> requestPermissions() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      status = await Permission.storage.request();
      if (status.isDenied) {
        status = await Permission.storage.request();
      } else if (status.isPermanentlyDenied) {
        status = await Permission.storage.request();
        openAppSettings();
      }
    }
  }

  Future<void> generateImage() async {
    if (promptController.text.trim().isEmpty) {
      emit(AiChatError("Please enter a prompt"));
      return;
    }

    emit(AiChatLoading());

    try {
      final encodedPrompt = Uri.encodeComponent(promptController.text.trim());
      final imageUrl =
          '$_baseUrl$encodedPrompt?width=1024&height=1024&based=${Random().nextInt(10000000)}&enhance=true';
      final response = await http.get(Uri.parse(imageUrl));

      if (response.statusCode == 200) {
        _generatedImage = response.bodyBytes;
        emit(AiChatGenerated(_generatedImage!, promptController.text.trim()));
        final generatedImagesBox = Hive.box<AiMessagingModel>(
          kAiChatHistoryBox,
        );
        final historyItem = AiMessagingModel(
          prompt: promptController.text.trim(),
          generatedImage: _generatedImage!,
        );
        await generatedImagesBox.add(historyItem);
      } else {
        emit(AiChatError('Failed to generate image. Please try again.'));
      }
    } catch (e) {
      emit(AiChatError(e.toString()));
    }
  }

  void setFromHistory(AiMessagingModel item) {
    promptController.text = item.prompt;
    _generatedImage = Uint8List.fromList(item.generatedImage);
    emit(AiChatGenerated(_generatedImage!, item.prompt));
  }

  Future<void> saveImageToGallery(BuildContext context) async {
    try {
      const MethodChannel channel = MethodChannel('gallery_saver');
      await channel.invokeMethod('saveImage', {'imageData': _generatedImage});
      showToast(S.of(context).imageSavedToGallery, AppColors.appCamelC);
    } on PlatformException catch (e) {
      print("Failed to save image: ${e.message}");
    }
  }

  Future<void> shareImage() async {
    if (_generatedImage == null) return;

    try {
      final directory = await getTemporaryDirectory();
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final fileName =
          promptController.text.isNotEmpty
              ? '${promptController.text}_$timestamp.png'
              : 'generated_image_$timestamp.png';
      final file = File('${directory.path}/$fileName');
      await file.writeAsBytes(_generatedImage!);

      await Share.shareXFiles([XFile(file.path)], text: promptController.text);
    } catch (e) {
      emit(AiChatError("Error sharing image: $e"));
    }
  }

  void clearImage() {
    promptController.clear();
    _generatedImage = null;
    emit(AiChatInitial());
  }

  @override
  Future<void> close() {
    promptController.dispose();
    return super.close();
  }
}
