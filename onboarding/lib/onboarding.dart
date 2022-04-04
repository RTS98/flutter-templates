import 'package:flutter/material.dart';
import 'package:onboarding/onboarding_helper.dart';

class OnBoarding extends StatelessWidget{
  final colors = const <Color>[
    Color(0xFFDAD3C8), 
    Color(0xFFFFE5DE),
    Color(0xFFDCF6E6)
  ];

  final controller = PageController();

  int _currentPage = 0;
  
  final contentList = const <OnboardingHelper>[
    OnboardingHelper("page1.png",
      "Track your work \nand get the result",
      "Rememeber to keep track of your professional accomplishments."
    ),
    OnboardingHelper("page2.png",
      "Stay organized \nwith team",
      "But understanding the contributions our colleagues make to our teams and companies."
    ),
    OnboardingHelper("page3.png",
      "Get notified when work happens",
      "Take control of notifications, collaborate live or on your own time."
    ),
  ];
  
  OnBoarding({Key? key}) : super(key: key);

  void changePage({int index = 2}){
    _currentPage ++;
    controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn
    );
  }
  final buttonStyle = TextButton.styleFrom(
    primary: Colors.white,
    padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 17.0),
    backgroundColor: Colors.black,
    shape: const StadiumBorder() 
  );

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: PageView.builder(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3, 
        itemBuilder: (context, index) => Container(
          color: colors[index],
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 60.0),
                Expanded(flex: 4, child: Image.asset("assets/${contentList[index].imagePath}")),
                const SizedBox(height: 40.0),
                Expanded(
                  flex: 1,
                  child: Text(
                    contentList[index].title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    contentList[index].description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 17.0,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<AnimatedContainer>.generate(
                      3,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color:  Color(0xFF000000),
                        ),
                        height: 10.0,
                        curve: Curves.easeIn,
                        width: _currentPage == index ? 20 : 10,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50.0),
                if (index != 2)
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () => changePage(),
                            child: const Text(
                              "SKIP",
                              style: TextStyle(fontSize: 16.0),
                            )
                          ),
                          TextButton(
                            onPressed: () => changePage(index: index + 1),
                            style: buttonStyle,
                            child: const Text("NEXT")
                          )
                        ],
                      ),
                    ),
                  )
                else
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: SizedBox(
                      width: 200,
                      child: TextButton(
                        onPressed: (){},
                        style: buttonStyle,
                        child: const Text("START")
                      ),
                    ),
                  )
              ]
            ),
          ),
        ),
      )
    );
  }
}