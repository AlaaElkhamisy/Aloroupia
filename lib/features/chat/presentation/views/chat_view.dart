import 'package:aloroupia/features/auth/presentation/view_models/authCubit/auth_cubit.dart';
import 'package:aloroupia/features/chat/presentation/views/widget/chat_app_bar.dart';
import 'package:aloroupia/features/chat/presentation/views/widget/chat_list_view.dart';
import 'package:aloroupia/features/chat/presentation/views/widget/chat_text_filed_and_submitt_button.dart';
import 'package:aloroupia/features/chat/presentation/views_models/chat_cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => ChatCubit()),
      ],
      child: Scaffold(
        appBar: ChatAppBar(),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  ChatListView(),
                  ChatTextFieldAndSubmittButton(
                    //messageController: _messageController,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
