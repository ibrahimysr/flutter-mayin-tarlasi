import 'package:flutter/material.dart';

import '../widget/Mybutton.dart';

class BeginnerPage extends StatefulWidget {
  const BeginnerPage({super.key});

  @override
  State<BeginnerPage> createState() => _BeginnerPageState();
}

class _BeginnerPageState extends State<BeginnerPage> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Stack(

          children:[
            Image.asset(
              'assets/background.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            // Şeffaflık efekti
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.6), // Şeffaflık seviyesi burada ayarlanıyor
                BlendMode.srcOver,
              ),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.transparent,
              ),
            ),

            Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [

              MyButton(baslik: "K O L A Y",zorluk: 8),
                MyButton(baslik: "O R T A ",zorluk: 15,),
                MyButton(baslik: "Z O R ",zorluk: 24,)

            ],),
          ),
       ] ),
      ),
    );
  }
}

