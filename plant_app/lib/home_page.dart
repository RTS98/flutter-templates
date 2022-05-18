import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant_app/category_headline.dart';
import 'package:plant_app/details/plant_details.dart';
import 'package:plant_app/search_bar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);
  final recomendedNames = const <String>[
    "SAMANTHA", "ANGELICA", "SILVANA"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/flower.svg"),
            label: ""
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/heart.svg"),
            label: ""
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/user.svg"),
            label: ""
          )
        ]
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.only(top: 300.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(
                    child: CategoryHeadline(categoryName: "Recomended")
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 230.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) => GestureDetector(
                          onTap: () => Navigator.push(context, 
                            MaterialPageRoute(
                              builder: (context) => const PlantDetails()
                            ),
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(right: 20.0),
                            width: 150.0, 
                            decoration:  const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset("assets/images/image_${index+1}.png"),
                                const SizedBox(height: 8.0),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        recomendedNames[index],
                                      ),
                                      const Text(
                                        "\$400",
                                        style: TextStyle(
                                          color: Colors.green
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 8.0, top: 5.0),
                                  child: Text(
                                    "Russia",
                                    style: TextStyle(
                                      color: Colors.green
                                    ),
                                  ),
                                )
                              ],
                            )
                          ),
                        ),
                        itemCount: 3
                      ),
                    )
                  ),
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: CategoryHeadline(categoryName: "Featured Plants"),
                    )
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 320.0,
                      child: ListView.separated(
                        separatorBuilder: (_, __) => const SizedBox(width: 20.0),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) => Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Image.asset(
                                "assets/images/bottom_img_${index+1}.png",
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 8.0),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: SizedBox(
                                  width: 260.0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children:  <Widget>[
                                      Text(
                                        recomendedNames[index],
                                      ),
                                      const Text(
                                        "\$400",
                                        style: TextStyle(
                                          color: Colors.green
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 8.0, top: 5.0),
                                child: Text(
                                  "Russia",
                                  style: TextStyle(
                                    color: Colors.green
                                  ),
                                ),
                              )
                            ],
                          )
                        ),
                        itemCount: 2
                      ),
                    )
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20.0),
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 15.0),                
                Expanded(
                  child: SvgPicture.asset(
                    "assets/icons/menu.svg",
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        "Hi Uishopy!",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                      Image.asset("assets/images/logo.png")
                    ],
                  ),
                ),
                const SizedBox(height: 70.0),
              ],
            )
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.28,
            child: const SearchBarWidget()
          )
        ],
      ),
    );
  }
}