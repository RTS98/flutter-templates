import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sleep_dashboard/colors.dart';
import 'package:sleep_dashboard/svg_waves.dart';

class CardWidget extends StatelessWidget {
  final double width;
  final int index;
  final List<Widget> children;
  const CardWidget(this.width, this.index, this.children, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration:  BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(26)),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [gradient1[index], gradient2[index]]
        ),
        boxShadow: [
          BoxShadow(
            color: gradient1[index].withOpacity(0.3),
            blurRadius: 13,
            spreadRadius: 3,
            offset: const Offset(3, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          SvgWaves("assets/images/vector-1.svg", width: width),
          SvgWaves("assets/images/vector.svg", width: width),
          ...children
        ]
      )
    );
  }
}

class CardActionIcons extends StatelessWidget {
  final double left;
  final double bottom;
  const CardActionIcons(this.left, this.bottom,{Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      bottom: bottom,
      child: Row(
        children: <Widget>[
          SvgPicture.asset("assets/icons/headphone.svg"),
          const SizedBox(width: 10.0),
          SvgPicture.asset("assets/icons/tape.svg")
        ]
      )
    );
  }
}