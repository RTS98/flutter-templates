import 'package:flutter/material.dart';

class CategoryHeadline extends StatelessWidget {
  final String categoryName;
  const CategoryHeadline({
    required this.categoryName, 
    Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            categoryName,
            style: const TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(30.0))
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: const Text(
                "More",
                style: TextStyle(
                  color: Colors.white
                ),
              )
            ),
          )
        ]
      )
    );
  }
}