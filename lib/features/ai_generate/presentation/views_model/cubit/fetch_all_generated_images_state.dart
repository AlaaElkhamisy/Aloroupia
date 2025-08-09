part of 'fetch_all_generated_images_cubit.dart';

sealed class FetchAllGeneratedImagesState extends Equatable {
  const FetchAllGeneratedImagesState();

  @override
  List<Object> get props => [];
}

final class FetchAllGeneratedImagesInitial
    extends FetchAllGeneratedImagesState {}

final class FetchAllGeneratedImagesLoading
    extends FetchAllGeneratedImagesState {}

final class FetchAllGeneratedImagesSuccess
    extends FetchAllGeneratedImagesState {}
