part of 'chat_bloc.dart';

@immutable
sealed class ChatBlocEvent {}


class ChatGenerateTextEvent extends ChatBlocEvent{
  final String message;

  ChatGenerateTextEvent({required this.message});
}