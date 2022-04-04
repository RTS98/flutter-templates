import 'package:flutter/material.dart';
import 'package:sleep_dashboard/card.dart';

class Recents extends StatelessWidget {
  const Recents({ Key? key }) : super(key: key);

  final recentList = const <String>[
    "Sleep Medidation",
    "Insomnia",
    "For Children",
    "Tips for Sleeping"
  ];

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20.0,
        crossAxisSpacing: 20.0
      ),
      delegate: SliverChildBuilderDelegate((context, index) => 
        CardWidget(166, index,
          [
            Positioned(
              left: 20.0,
              top: 20.0,
              child: SizedBox(
                width: 130,
                child:  Text(
                  recentList[index],
                  style: const TextStyle(                              
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ),
            const CardActionIcons(20, 20)
          ],
        ),
        childCount: 4
      )
    );
  }
}