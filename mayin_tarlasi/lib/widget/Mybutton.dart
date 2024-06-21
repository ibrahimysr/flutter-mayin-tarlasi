import 'package:flutter/material.dart';

import '../Page/HomePage.dart';

class MyButton extends StatelessWidget {
  String baslik;
  int zorluk;
  MyButton({
    super.key,
    required this.baslik,
    required this.zorluk
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: SizedBox(
          width: 250,
          height: 60,
          child: ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(baslik: baslik,zorluk: zorluk)));
          }, child:Text(baslik,style: TextStyle(color: Colors.black,fontSize: 18),) ,style: ElevatedButton.styleFrom(
            backgroundColor:Colors.grey[300],

          ),)),
    );
  }
}
