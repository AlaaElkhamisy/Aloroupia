import 'package:aloroupia/constants.dart';
import 'package:aloroupia/features/ai_generate/data/ai_messaging_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';

part 'fetch_all_generated_images_state.dart';

class FetchAllGeneratedImagesCubit extends Cubit<FetchAllGeneratedImagesState> {
  FetchAllGeneratedImagesCubit() : super(FetchAllGeneratedImagesInitial());
  List<AiMessagingModel>? generatedImages;
  fetchAllGeneratedImages() {
    var generatedImagesBox = Hive.box<AiMessagingModel>(kAiChatHistoryBox);
    generatedImages = generatedImagesBox.values.toList();
    emit(FetchAllGeneratedImagesSuccess());
  }
}
