import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PlantDetails extends StatelessWidget {
  const PlantDetails({Key? key}) : super(key: key);
  final iconsList = const <String>[
    "assets/icons/sun.svg",
    "assets/icons/icon_2.svg",
    "assets/icons/icon_3.svg",
    "assets/icons/icon_4.svg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => Navigator.pop(context), 
                      icon: SvgPicture.asset("assets/icons/back_icon.svg")
                    ),
                    const SizedBox(height: 100.0),
                    SizedBox(
                      width: 60.0,
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (_, __) => const SizedBox(height: 30.0),
                        itemBuilder: (_, index) =>  Container(
                          child: SvgPicture.asset(iconsList[index]),
                          height: 60.0,
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                offset: const Offset(0, 15),
                                blurRadius: 22,
                                color: const Color(0xFF0C9869).withOpacity(0.22),
                              ),
                              const BoxShadow(
                                offset: Offset(-15, -15),
                                blurRadius: 20,
                                color: Colors.white,
                              ),
                            ]
                          ),
                        ),
                        itemCount: 4,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 40.0),
              Expanded(
                child: Container(
                  height: 700.0,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(63),
                      bottomLeft: Radius.circular(63),
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 10),
                        blurRadius: 60,
                        color: const Color(0xFF0C9869).withOpacity(0.29),
                      ),
                    ],
                    image: const DecorationImage(
                      alignment: Alignment.centerLeft,
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/img.png"),
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: <Widget>[
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Angelica\n",
                        style: TextStyle(
                          fontSize: 23.0,
                          color: Color(0xFF3C4046), 
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      TextSpan(
                        text: "Russia",
                        style: TextStyle(
                          fontSize: 19,
                          color: Color(0xFF0C9869),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                const Text(
                  "\$400",
                  style: TextStyle(
                    color: Color(0xFF0C9869)
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: const Size(100, 50),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                        ),
                      ),
                      backgroundColor: const Color(0xFF0C9869)
                    ),
                    onPressed: (){}, 
                    child: const Text(
                      "Buy Now",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: (){}, 
                    child: const Text(
                      "Description",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
