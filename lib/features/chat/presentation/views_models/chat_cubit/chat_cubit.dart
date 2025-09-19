import 'package:aloroupia/constants.dart';
import 'package:aloroupia/features/chat/data/models/message_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  List<Message> messagesList = [];
  CollectionReference messages = FirebaseFirestore.instance.collection(
    "messages",
  );

  void sendMessage({required String message, required String email}) async {
    messages.add({
      kMessage: message,
      kSenderId: email,
      kCreatedAt: DateTime.now(),
    });
  }

  void getMessages() {
    messages.orderBy(kCreatedAt, descending: true).snapshots().listen((event) {
      // final messagesList = event.docs.map((doc) {
      //   return {
      //     kMessage: doc[kMessage],
      //     "senderId": doc["senderId"],
      //     kCreatedAt: doc[kCreatedAt],
      //   };
      // }).toList();
      // emit(ChatLoaded(messages: messagesList));

      for (var doc in event.docs) {
        print("Doc: ${doc}");
        messagesList.add(Message.fromJson(doc));
      }
      emit(ChatSuccess(messages: messagesList));
    });
  }
}
