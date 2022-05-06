import 'package:flutter/material.dart';

class NameWidget extends StatelessWidget{
  final String name;
  const NameWidget({required this.name, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.bold
      ),
    );
  }
  
}