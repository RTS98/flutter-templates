import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget{
  final List<Widget> children;
  const AppBarWidget({required this.children, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ...children,
            const Icon(Icons.info_outline_rounded)
          ],
        ),
      ),
    );
  }
}