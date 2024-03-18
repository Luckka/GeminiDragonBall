import 'package:bloc/bloc.dart';
import 'package:gemini_dragon_ball/models/chat_message_model.dart';
import 'package:meta/meta.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBlocBloc extends Bloc<ChatBlocEvent, ChatBlocState> {
  ChatBlocBloc() : super(ChatBlocInitial()) {
    on<ChatBlocEvent>((event, emit) {
      // TODO: implement event handler
    });

    List<ChatMessageModel> messages = [];
  }
}
