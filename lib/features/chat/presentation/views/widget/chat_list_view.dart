import 'package:aloroupia/features/auth/presentation/view_models/authCubit/auth_cubit.dart';
import 'package:aloroupia/features/chat/data/models/message_model.dart';
import 'package:aloroupia/features/chat/presentation/views/widget/chat_bubbles.dart';
import 'package:aloroupia/features/chat/presentation/views_models/chat_cubit/chat_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {
        List<Message> messages =
            BlocProvider.of<ChatCubit>(context).messagesList;
        // Handle state changes if needed
        if (state is ChatSuccess) {
          messages = state.messages;
        }
      },
      builder: (context, state) {
        List<Message> messages =
            BlocProvider.of<ChatCubit>(context).messagesList;
        final email = BlocProvider.of<AuthCubit>(context).userModel.email;
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ListView.separated(
              reverse: true,
              itemBuilder: (context, index) {
                //final message = messages[index];
                return messages[index].senderId == email
                    ? ChatBubble(
                      text: messages[index].message,
                      timestamp: DateTime.now(),
                    )
                    : AloroupiaChatBubble(
                      text: messages[index].message,
                      timestamp: DateTime.now(),
                    );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: messages.length,
            ),
          ),
        );
      },
    );
  }
}
