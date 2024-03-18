import 'package:dio/dio.dart';
import 'package:gemini_dragon_ball/utils/constants.dart';

import '../models/chat_message_model.dart';

class ChatRepository {
  static chatTextGenerationRepo(List<ChatMessageModel> previousMessages) async {

    try{
      Dio dio = Dio();

    final response = dio.post(
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.0-pro:generateContent?key=$apiKey",
        data: {
          "candidates": previousMessages.map((e) => e.toMap()) .toList(),
          "promptFeedback": {
            "safetyRatings": [
              {
                "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
                "probability": "NEGLIGIBLE"
              },
              {
                "category": "HARM_CATEGORY_HATE_SPEECH",
                "probability": "NEGLIGIBLE"
              },
              {
                "category": "HARM_CATEGORY_HARASSMENT",
                "probability": "NEGLIGIBLE"
              },
              {
                "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
                "probability": "NEGLIGIBLE"
              }
            ]
          }
        });

    }catch(err){

    }
  }

}