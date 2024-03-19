part of 'chat_bloc.dart';

@immutable
sealed class ChatState {}

final class ChatBlocInitial extends ChatState {}


class ChatSucessState extends ChatState{
  final List<ChatMessageModel> messages;

  ChatSucessState({required this.messages});
}