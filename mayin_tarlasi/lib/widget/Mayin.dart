// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Mayin extends StatelessWidget {
  
  bool revelead;
    final function;
  Mayin({super.key,required this.revelead,this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          color:  revelead ? Colors.grey[800] : Colors.grey[400],
          child: Center(child: revelead  ? Icon(Icons.dangerous,color: Colors.red[900],): Text("")),
        ),
      ),
    );
  }
}