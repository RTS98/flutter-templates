import 'package:flutter/material.dart';
import 'package:sleep_dashboard/bottom_navigation_bar.dart';
import 'package:sleep_dashboard/header.dart';
import 'package:sleep_dashboard/recents.dart';
import 'package:sleep_dashboard/recommendations.dart';

class Dashboard extends StatelessWidget{
  const Dashboard({Key? key}) : super(key: key);
  
  final categoryStyle = const TextStyle(
    fontSize: 14.0,
    color: Color(0xff515979),
    fontWeight: FontWeight.w500
  );

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xFF121421),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: CustomScrollView(
            slivers: <Widget>[
              const Header(),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  <Widget>[
                      Text(
                        "Recommended",
                        style: categoryStyle
                      ),
                      Text(
                        "See all",
                        style: categoryStyle.copyWith(
                          color: const Color(0xFF497EEB)
                        )
                      )
                    ],
                  ),
                ),
              ),
              const Recommendations(),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Text(
                    "Recent",
                    style: categoryStyle
                  ),
                ),
              ),
              const Recents()
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget()
    );
  }
}