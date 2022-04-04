import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgWaves extends StatelessWidget{
  final String path;
  final double width;
  const SvgWaves(this.path, {required this.width, Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context){
    return Positioned(
      bottom: 0.0,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(26),
          bottomRight: Radius.circular(26),
        ),
        child: SvgPicture.asset(
          path,
          width: width,
        ),
      ),
    );
  }
}