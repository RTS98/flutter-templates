import 'package:drawer/line_progress.dart';
import 'package:drawer/models/category.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final TaskCategory taskCategory;
  const CardWidget(this.taskCategory, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)) 
      ),
      shadowColor:Colors.black.withOpacity(0.2),
      elevation: 2.0,
      child: SizedBox(
        width: 200,
        height: 100,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 10.0),
              Text(
                "${taskCategory.title} tasks",
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.withOpacity(0.9),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                taskCategory.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0
                ),
              ),
              const SizedBox(height: 20),
              LineProgress(taskCategory)
            ]
          ),
        ),
      ),
    );
  }
}