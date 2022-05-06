import 'package:flutter/material.dart';

class TaskCategory {
  final int taskCounter;
  final String title;
  final double percentTasksDone;
  final Color progressColor;

  const TaskCategory(this.title, this.taskCounter, this.percentTasksDone, this.progressColor);
}
