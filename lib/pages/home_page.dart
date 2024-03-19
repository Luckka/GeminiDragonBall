import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_dragon_ball/bloc/chat_bloc.dart';
import 'package:gemini_dragon_ball/models/chat_message_model.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ChatBloc chatBloc = ChatBloc();
  TextEditingController textEditingController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ChatBloc, ChatState>(
        bloc: chatBloc,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          switch(state.runtimeType){
            case ChatSucessState: 
            List<ChatMessageModel> messages = (state as ChatSucessState).messages;
            return Container(
            
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
                
                image: DecorationImage(
                    opacity: 0.3,
                    image: AssetImage('assets/dragonball_bg.jpg'),
                    fit: BoxFit.cover)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: 100,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Dragon Ball',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.image_search),
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                Expanded(child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context,index){
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12,left: 16,right: 16),
                    padding:const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.black.withOpacity(0.5)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(messages[index].role == "user" ? "User" : "Gemini",style: TextStyle(fontSize: 16,color: messages[index].role == "user" ? Colors.amber : Colors.blue),),
                        SizedBox(height: 19,),
                        Text(messages[index].parts.first.text,),
                      ],
                    ));
                })),
                if(chatBloc.generating)
                 Row(
                   children: [
                     SizedBox(
                      height: 120,
                      width: 120,
                      child: Lottie.asset("assets/loader.json")),
                      // const SizedBox(width: 10,),
                      // const Text('Loading...')
                   ],
                 ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
                  height: 120,
                  child: Row(
                    children: [
                      Expanded(
                          child: TextField(
                          controller: textEditingController,
                        
                        style: TextStyle(color: Colors.black),
                        cursorColor: Theme.of(context).primaryColor,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100)),
                            fillColor: Colors.white,
                            hintText: 'Ask something to Gemini',
                            hintStyle: TextStyle(color: Colors.black),
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor))),
                      )),
                      const SizedBox(
                        width: 12,
                      ),
                      InkWell(
                        onTap: () {
                          if(textEditingController.text.isNotEmpty){
                            String text = textEditingController.text;
                            textEditingController.clear();
                            chatBloc.add(ChatGenerateTextEvent(message: text));
                          }
                        },
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Theme.of(context).primaryColor,
                          child: Center(
                            child: Icon(
                              Icons.send,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
            default: 

            return SizedBox();
          }
        },
      ),
    );
  }
}
