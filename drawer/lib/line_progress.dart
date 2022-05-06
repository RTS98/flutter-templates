import 'package:drawer/models/category.dart';
import 'package:flutter/material.dart';

class LineProgress extends StatefulWidget {
  final TaskCategory taskCategory;
  const LineProgress(this.taskCategory, { Key? key }) : super(key: key);

  @override
  State<LineProgress> createState() => _LineProgressState();
}

class _LineProgressState extends State<LineProgress> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState(){
    controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this
    );
    animation = 
      Tween<double>(begin: 0.0, end: widget.taskCategory.percentTasksDone)
      .animate(controller);
    controller.forward();
    super.initState();
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) 
    => LinearProgress(widget.taskCategory.progressColor, animation: animation);
}

class LinearProgress extends AnimatedWidget {
  final Color color;
  const LinearProgress(this.color, {required Animation animation, Key? key}) 
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context){
    final animation = listenable as Animation;
    return LinearProgressIndicator(
      value: animation.value,
      valueColor: AlwaysStoppedAnimation(color),
      backgroundColor: Colors.purple[100],
    ); 
  }
}