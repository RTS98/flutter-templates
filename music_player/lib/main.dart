import 'package:flutter/material.dart';
import 'package:music_player/app_bar_widget.dart';
import 'package:music_player/model/song.dart';
import 'package:music_player/song_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final TextStyle singerNameStyle = const TextStyle(
    color: Colors.white,
    fontSize: 55,
    fontFamily: "Coral_Pen"
  );

  final List<Song> songsNameList = const [
    Song("No tears left to cry", "5:12"),
    Song("Imagine", "3:20"),
    Song("Into you", "4:12"),
    Song("One last time", "4:40"),
    Song("7 rings", "2:58"),
    Song("Thank u, next", "3:27")
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Campton_Light",
        primarySwatch: Colors.blue,
        iconTheme: const IconThemeData(
          color: Colors.white
        )
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: <Widget>[
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Padding(
                      padding: EdgeInsets.only(top: constraints.maxHeight * 0.55),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const <Widget>[
                               Text(
                                "Popular",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800
                                ),
                              ),
                              Text(
                                "See all",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Color(0xFF7D9AFF),
                                  fontWeight: FontWeight.w600,
                                  
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: ListView.separated(
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) => 
                                ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  title:  Text(
                                    songsNameList[index].name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.0,                     
                                    ),
                                  ),
                                  onTap: () => showModalBottomSheet(
                                    context: context,
                                    backgroundColor: Colors.transparent,
                                    isScrollControlled: true,
                                    builder: (context) => SongDetails(songsNameList[index]) 
                                  ),
                                  trailing: SizedBox(
                                    height: 20,
                                    width: 75,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(songsNameList[index].length,
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12.0    
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        const Icon(
                                          Icons.more_horiz,    
                                          color: Colors.grey,
                                        )
                                      ]
                                    ),
                                  ),
                                ), 
                              separatorBuilder: (_, __) 
                                => const Divider(
                                  height: 0.0,
                                  thickness: 1.0,
                                  color: Color.fromARGB(255, 236, 231, 231),
                              ), 
                              itemCount: songsNameList.length
                            ),
                          )
                        ] 
                      ),
                    ),
                  ),
                ),
                Container(
                  height: constraints.maxHeight * 0.5,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
                    image:  DecorationImage(
                      image: AssetImage("images/ariana_grande_cover.jpeg"),
                      fit: BoxFit.cover,                
                    ),
                  ),
                ),
                Positioned(
                  left: constraints.maxWidth * 0.05,
                  top: constraints.maxHeight * 0.31,
                  child: const Text(
                    "Trending",
                    style: TextStyle(
                      color: Color(0xFF7D9AFF),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w800   
                    ),
                  )
                ),
                Positioned(
                  left: constraints.maxWidth * 0.05,
                  top: constraints.maxHeight * 0.35,
                  child: Text(
                    "Ariana",
                    style: singerNameStyle
                  )
                ),
                Positioned(
                  left: constraints.maxWidth * 0.05,
                  top: constraints.maxHeight * 0.39,
                  child: Text(
                    "Grande",
                    style: singerNameStyle
                  )
                ),
                Positioned(
                  top: constraints.maxHeight * 0.47,
                  right: 30.0,
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF7D9AFF),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          offset: const Offset(4.0, 4.0),
                          blurRadius: 3.0,
                        ),
                      ] 
                    ),
                    child: const Icon(
                      Icons.play_arrow,
                    ),
                  )
                ),
                const Positioned(
                  top: 50.0,
                  child: AppBarWidget(
                    children: <Widget>[
                      Icon(Icons.menu),
                    ],
                  )
                )
              ],
            );
          }
        ),
      )
    );
  }
}

