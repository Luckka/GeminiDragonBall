import 'package:flutter/material.dart';
import 'package:gemini_dragon_ball/pages/home_page.dart';

void main(){
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.grey.shade900,
        primaryColor: Colors.deepPurple.shade300

      ),
    );
  }
}