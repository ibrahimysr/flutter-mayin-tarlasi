import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyNumberBox extends StatelessWidget {
  final child;
  bool revelead;
  final function;
 MyNumberBox({super.key, this.child,required this.revelead,this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  function,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          color: revelead ? Colors.grey[200] : Colors.grey[400],
          child: Center(child: Text(revelead ? ( child== 0 ? '' : child.toString()) : '',style: TextStyle(fontWeight: FontWeight.bold,
          color: child == 1 ? Colors.blue : (child==2 ? Colors.green : Colors.red)
          
          ),)  ),
        ),
      ),
    );
  }
}