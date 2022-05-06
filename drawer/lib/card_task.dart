import 'package:flutter/material.dart';

class CardTask extends StatefulWidget {
  const CardTask({Key? key}) : super(key: key);

  @override
  State<CardTask> createState() => _CardTaskState();
}

class _CardTaskState extends State<CardTask> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> animation;
  bool isChecked = false;
  late TextPainter size;

  final style = const TextStyle(
    fontWeight: FontWeight.bold,
  );


  @override
  void initState(){
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500)
    );
    
    size = TextPainter(
      text: TextSpan(
        text: "Task name",
        style: style
      ),
      textDirection: TextDirection.ltr
    )..layout(minWidth: 0, maxWidth: double.infinity)
    ..size;
    
    animation = Tween<double>(begin: 0.0, end: size.width)
      .animate(controller)
      ..addListener(() => setState(() =>{}));
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        height: 60.0,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15.0))
        ),
        child: Stack(
          children: [
            Positioned(
              top: 6.0,
              child: Row(
                children: <Widget>[
                  Checkbox(
                    shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    activeColor: const Color(0xFF002FFF),
                    value: isChecked,
                    onChanged: (value) {
                      isChecked = value!;
                      if(value){
                        controller.forward();
                      } else {
                        controller.reverse(from: size.width); 
                      }
                    }
                  ),
                  const Text(
                    "Task name",
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    )
                  ),
                ]
              ),
            ),
            Positioned(
              left: 49.0,
              top: 30.0,
              child: CustomPaint(
                painter: LinePainter(animation.value),
              ),
            )
          ],
        ),
      )
    );
  }
  
  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }
  
}

class LinePainter extends CustomPainter { 
  final double value;
  LinePainter(this.value);
  
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0;

    canvas.drawLine(const Offset(0, 0), Offset(value, 0), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
