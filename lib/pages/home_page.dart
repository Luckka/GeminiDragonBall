import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/dragonball_bg.jpg'),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 100,
              
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Dragon Ball',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                  IconButton(onPressed: (){}, icon: Icon(Icons.image_search),color: Colors.white,)
                ],
              ),
            ),
            Expanded(child: ListView()),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
              height: 120,
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    style: TextStyle(color: Colors.black),
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100)),
                        fillColor: Colors.white,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor))),
                  )),
                  const SizedBox(
                    width: 12,
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Center(
                      child: Icon(Icons.send,color: Colors.black,),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
