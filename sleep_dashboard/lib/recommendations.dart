import 'package:flutter/material.dart';
import 'package:sleep_dashboard/card.dart';

class Recommendations extends StatelessWidget {
  const Recommendations({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: SizedBox(
          height: 190.0,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => CardWidget(320.0,
              index,
              const <Widget>[
                Positioned(
                  left: 30.0,
                  top: 30.0,
                  child: Text(
                    "Sleep Medidation",
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                Positioned(
                  left: 30.0,
                  top: 55.0,
                  child: Text(
                    "7 Day Audio Series",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color(0xFFC6C3fc),
                    ),
                  ),
                ),
                CardActionIcons(30, 30)
              ],
            ), 
            separatorBuilder: (context, index) => const SizedBox(width: 10.0), 
            itemCount: 4
          ),
        ),
      ),
    );
  }
}
