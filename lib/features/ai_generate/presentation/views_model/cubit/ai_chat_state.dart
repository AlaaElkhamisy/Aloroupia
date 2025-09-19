part of 'ai_generator_cubit.dart';

abstract class AiChatState extends Equatable {
  const AiChatState();

  @override
  List<Object?> get props => [];
}

class AiChatInitial extends AiChatState {}

class AiChatLoading extends AiChatState {}

class AiChatGenerated extends AiChatState {
  final Uint8List image;
  final String prompt;

  const AiChatGenerated(this.image, this.prompt);

  @override
  List<Object?> get props => [image, prompt];
}

class AiChatError extends AiChatState {
  final String message;

  const AiChatError(this.message);

  @override
  List<Object?> get props => [message];
}

class AiChatSuccess extends AiChatState {
  final String message;

  const AiChatSuccess(this.message);

  @override
  List<Object?> get props => [message];
}
