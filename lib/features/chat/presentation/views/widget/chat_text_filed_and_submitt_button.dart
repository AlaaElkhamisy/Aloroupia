import 'package:aloroupia/core/manager/colors/app_colors.dart';
import 'package:aloroupia/features/auth/presentation/view_models/authCubit/auth_cubit.dart';
import 'package:aloroupia/features/chat/presentation/views_models/chat_cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatTextFieldAndSubmittButton extends StatefulWidget {
  const ChatTextFieldAndSubmittButton({
    super.key,
    //required this.messageController,
    //this.onPressed,
  });

  //final TextEditingController messageController;
  //final void Function()? onPressed;

  @override
  State<ChatTextFieldAndSubmittButton> createState() =>
      _ChatTextFieldAndSubmittButtonState();
}

class _ChatTextFieldAndSubmittButtonState
    extends State<ChatTextFieldAndSubmittButton> {
  final TextEditingController _messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      verticalDirection: VerticalDirection.down,
      children: [
        Expanded(
          child: TextFormField(
            maxLines: null,
            controller: _messageController,
            //onFieldSubmitted: (value) => _sendMessage(),
            validator: (data) {
              if (data!.isEmpty) {
                return 'field is required';
              }
              return null;
            },
            decoration: InputDecoration(
              prefixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.attach_file_rounded, color: Colors.black),
              ),
              enabledBorder: buildBorder(),
              focusedBorder: buildBorder(),
            ),
          ),
        ),
        const SizedBox(width: 10),
        CircleAvatar(
          radius: 25,
          backgroundColor: AppColors.appYellowC,
          child: IconButton(
            icon: const Icon(Icons.send, color: Colors.black),
            onPressed: () {
              final authCubit = BlocProvider.of<AuthCubit>(context);
              final email = authCubit.userModel.email;
              BlocProvider.of<ChatCubit>(context).sendMessage(
                email: email ?? '',
                message: _messageController.text.trim(),
              );

              _messageController.clear();
            },
          ),
        ),
      ],
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black, width: 2),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
