import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({ Key? key }) : super(key: key);

  @override
  State<BottomNavigationBarWidget> createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int selectedIndex = 0;

  void changePage(int index) => setState(() => selectedIndex = index);
  
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xff1C2031),
      currentIndex: selectedIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: changePage,
      items: [
        BottomNavigationBarItem(
          label: "Discover",
          icon: SvgPicture.asset(
            "assets/icons/discover.svg",
            color: selectedIndex == 0 
              ? const Color(0xff4A80F0)
              : null
          )
        ),
        BottomNavigationBarItem(
          label: "Chart",
          icon: SvgPicture.asset(
            "assets/icons/chart.svg",
            color: selectedIndex == 1 
              ? const Color(0xff4A80F0)
              : null,
          )
        ),
        BottomNavigationBarItem(
          label: "Profile",
          icon: SvgPicture.asset(
            "assets/icons/profile.svg",
            color: selectedIndex == 2 
              ? const Color(0xff4A80F0)
              : null
          )
        ),
      ],
    );
  }
}