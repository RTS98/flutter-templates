import 'package:drawer/widgets/drawer_widget.dart';
import 'package:drawer/homepage.dart';
import 'package:flutter/material.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({Key? key}) : super(key: key);

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  bool isDragging = false;
  late double xOffset;
  late double yOffset;
  late double scaleFactor;
  late bool isDrawingOpen;


  void openDrawer() {
    setState(() {
      xOffset = 250;
      yOffset = 75;
      scaleFactor = 0.85;
      isDrawingOpen = true;
    });
  }

  void closeDrawer() {
    setState(() {
      xOffset = 0;
      yOffset = 0;
      scaleFactor = 1;
      isDrawingOpen = false;
    });
  }

  @override
  void initState(){
    closeDrawer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF04123F),
      body: Stack(
        children: [
          DrawerWidget(closeDrawer: closeDrawer),
          GestureDetector(
            onHorizontalDragStart: (details) => isDragging = true,
            onHorizontalDragUpdate: (details) {
              const delta = 1;
              if (!isDragging) return;
              if (details.delta.dx > delta) {
                openDrawer();
              } else if (details.delta.dx < -delta) {
                closeDrawer();
              }
            },
            onTap: closeDrawer,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              transform: Matrix4.translationValues(xOffset, yOffset, 0)
                ..scale(scaleFactor),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(isDrawingOpen ? 30 : 0),
                child: HomePage(
                  openDrawer: openDrawer,
                ),
              ),
            ),
          )
        ]
      ) 
    );
  }
}
