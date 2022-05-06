import 'package:drawer/card_task.dart';
import 'package:drawer/widgets/card_widget.dart';
import 'package:drawer/models/category.dart' ;
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  final VoidCallback openDrawer;
  const HomePage({required this.openDrawer, Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation ;
  var categoryList = const <TaskCategory>[
    TaskCategory("Business", 40, 0.3, Color(0xFFAC05FF)),
    TaskCategory("Personal", 20, 0.5,  Color(0xFF002FFF)),
  ];
  var counter = 2;

  @override
  void initState(){
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500)
    );
    animation = Tween<double>(begin: 1.0, end: 0.0).animate(controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xffF4F6FD),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: const <Widget>[
          Icon(Icons.search),
          SizedBox(width: 10),
          Icon(Icons.notifications_none),
          SizedBox(width: 15),
        ],
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: widget.openDrawer,
          icon: const Icon(Icons.menu)
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  <Widget>[
                  const SizedBox(height: 10.0),
                  const Text(
                    "What's up, Joy?",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    "CATEGORIES",
                    style: TextStyle(
                      color: Colors.grey.withOpacity(0.8),
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: constraints.maxWidth,
                    height: 100.0,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryList.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 10.0),
                      itemBuilder: (context, index) => CardWidget(categoryList[index])
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    "TODAY'S TASKS",
                    style: TextStyle(
                      color: Colors.grey.withOpacity(0.8),
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Expanded(
                    child: SizedBox(
                      child: ListView.separated(
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                        separatorBuilder: (_, __) => const SizedBox(height: 5.0),
                        itemCount: counter,
                        itemBuilder: (_, index) => Dismissible(
                          key: UniqueKey(),
                          direction: DismissDirection.endToStart,
                          resizeDuration: const Duration(seconds: 2),
                          onResize: () => controller.forward(),
                          onDismissed: (direction) {
                            //simulate delete list item
                            counter--;
                            controller.reset();
                          },
                          background: FadeTransition(
                            opacity: animation,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: const <Widget>[
                                    Icon(Icons.delete),
                                    SizedBox(width: 10.0),
                                    Text("The task was deleted"),
                                  ],
                                ),
                                TextButton(
                                  onPressed: (){}, 
                                  style: TextButton.styleFrom(
                                    side: const BorderSide(
                                      color: Colors.grey
                                    ),
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(30.0)
                                      )
                                    )
                                  ),
                                  child:  Text(
                                    "UNDO",
                                    style: TextStyle(
                                      color: const Color.fromARGB(255, 66, 75, 84).withOpacity(0.9),
                                      fontWeight: FontWeight.bold
                                    ),
                                  )
                                )
                              ]
                            ),
                          ),
                          child: const CardTask()
                        )
                      )
                    ),
                  ),
                ]
              );
            }
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: const Color(0xFF002FFF),
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }
}