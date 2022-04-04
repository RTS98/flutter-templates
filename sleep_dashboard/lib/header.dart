import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Header extends StatefulWidget {
  const Header({ Key? key }) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final _symptomnsList = const <String>["Insomnia", "Depression", "Baby Sleep"];
  int _selectedSymptom = 0;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Discover",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    height: 2.2,
                    width: 33,
                    decoration: const BoxDecoration(
                      color: Color(0xff4271d3),
                    ),
                  ),
                ],
              ),
              SvgPicture.asset("assets/icons/search.svg")
            ],
          ),
          const SizedBox(height: 40.0),
          SizedBox(
            height: 40.0,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (ctx, index) => const SizedBox(width: 20.0), 
              itemCount: 3,
              itemBuilder: (context, index) => GestureDetector(
                  onTap: () => setState(() {
                    _selectedSymptom = index;
                  }),
                  child: AnimatedContainer(
                    curve: Curves.easeOut,
                    duration: const Duration(milliseconds: 500),
                    alignment: Alignment.center,
                    decoration:  BoxDecoration(
                      color:  _selectedSymptom == index 
                        ? const Color(0xff4E81EB)
                        : const Color(0xff1C2031),
                      borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                      boxShadow: _selectedSymptom == index 
                        ? [
                            BoxShadow( 
                              color: const Color(0xff4A80F0).withOpacity(0.3),
                              blurRadius: 4.0,
                              spreadRadius: 2.0,
                              offset: const Offset(1, 1),
                            )
                          ]
                        : []  
                    ),
                    child: Padding(
                      padding:  const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        _symptomnsList[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                )
              ),
            )
        ],
      ),
    );
  }
}