import 'package:flutter/material.dart';
import 'package:news_app/blocs/bottom_nav_bar_bloc.dart';
import 'package:news_app/screens/search_page.dart';
import 'package:news_app/screens/source_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final _bottomNavBarBloc = BottomNavBarBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF191826),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xFF191826),
        title: const Text(
          "Level up",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0
          ),
        ),
        centerTitle: false,
        actions: const <Widget>[
          Icon(Icons.info),
          SizedBox(width: 10.0)
        ],
      ),
      body: Container(),
      // body: StreamBuilder<NavBarItem>(
      //   stream: _bottomNavBarBloc.itemStream,
      //   initialData: _bottomNavBarBloc.defaultItem,
      //   builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot){
      //     switch(snapshot.data){
      //       case NavBarItem.HOME:
      //         return HomePage();
      //       case NavBarItem.SEARCH:
      //         return const SearchPage();
      //       case NavBarItem.SOURCES:
      //         return const SourcePage();
      //       default: return Container();
      //     } 
      //   }
      // ),
      bottomNavigationBar: StreamBuilder(
        stream: _bottomNavBarBloc.itemStream,
        initialData: _bottomNavBarBloc.defaultItem,
        builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot){
          return Container(
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey[100]!, 
                  spreadRadius: 0, 
                  blurRadius: 10
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0)
              ),
              child: BottomNavigationBar(
                backgroundColor: const Color(0xff191832),
                iconSize: 20,
                unselectedItemColor: const Color(0xFFE5E5E5),
                unselectedFontSize: 8.5,
                selectedFontSize: 8.5,
                type: BottomNavigationBarType.fixed,
                currentIndex: snapshot.data!.index,
                selectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.w600
                ),
                selectedItemColor: Colors.white,
                onTap: _bottomNavBarBloc.pickItem,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    label: "Home",
                    icon:  Icon(Icons.home_outlined),
                    activeIcon: Icon(Icons.home),
                  ),
                  BottomNavigationBarItem(
                    label: "Sources",
                    icon:  Icon(Icons.grid_view_outlined),
                    activeIcon: Icon(Icons.grid_view_sharp),
                  ),
                  BottomNavigationBarItem(
                    label: "Search",
                    icon:  Icon(Icons.search_outlined),
                    activeIcon: Icon(Icons.search),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
