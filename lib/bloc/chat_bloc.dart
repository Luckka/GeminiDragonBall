import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gemini_dragon_ball/models/chat_message_model.dart';
import 'package:gemini_dragon_ball/repository/chat_repository.dart';
import 'package:meta/meta.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatBlocEvent, ChatState> {
  ChatBloc() : super(ChatSucessState(messages: [])) {
    on<ChatGenerateTextEvent>(chatGenerateTextEvent);

   
  }

   List<ChatMessageModel> messages = [];
    bool generating = false;
  Future <void> chatGenerateTextEvent(ChatGenerateTextEvent event, Emitter<ChatState> emit) async{
    messages.add(ChatMessageModel(role: 'user', parts: [
      ChatPartModel(text: event.message)
    ]));
    emit(ChatSucessState(messages: messages));
    generating = true;

    String response = await ChatRepository.chatTextGenerationRepo(messages);

    if(response.length > 0){
      messages.add(ChatMessageModel(role: 'model', parts: [
        ChatPartModel(text: response)
      ]));    
      emit(ChatSucessState(messages: messages));
      }

      generating = false;
  }
}
