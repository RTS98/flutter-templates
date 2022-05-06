import 'package:flutter/material.dart';

class ProgressAvatarWidget extends StatefulWidget {
  const ProgressAvatarWidget({ Key? key }) : super(key: key);

  @override
  State<ProgressAvatarWidget> createState() => _ProgressAvatarWidgetState();
}

class _ProgressAvatarWidgetState extends State<ProgressAvatarWidget> 
  with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState(){
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this
    );
    animation = 
      Tween<double>(begin: 0.0, end: 0.6)
      .animate(controller)
      ..addListener(() => setState(() =>{}));
    Future.delayed(const Duration(seconds: 2), (() => controller.forward()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          CircularProgressIndicator(
            value: animation.value,
            valueColor: const AlwaysStoppedAnimation(Color(0xFFFF00FF)),
            backgroundColor: Colors.grey.withOpacity(0.2),
          ),
          const Center(
            child: CircleAvatar(
              backgroundImage: AssetImage(
                "assets/Avatar.jpeg"
              ),
              radius: 40.0,
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }
}