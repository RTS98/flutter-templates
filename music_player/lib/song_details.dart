import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:music_player/app_bar_widget.dart';
import 'package:music_player/model/song.dart';

class SongDetails extends StatelessWidget{
  final Song song;
  const SongDetails(this.song, {Key? key}) : super(key: key);
  final TextStyle durationStyle = const TextStyle(
    color: Colors.grey,
    fontSize: 9.0    
  );
 
  @override
  Widget build(BuildContext context){
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10.0,
              sigmaY: 10.0
            ),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.15,
              color: Colors.black.withOpacity(0.0),
            ),
          ),
          Positioned(
            top: 50.0,
            child: AppBarWidget(
              children: <Widget>[
                 IconButton(
                  constraints: const BoxConstraints(
                    maxWidth: 24.0
                  ),
                  padding: EdgeInsets.zero,
                  alignment: Alignment.centerLeft,
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
                const Text(
                  "Artist",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.15,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.85,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0)
                )
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 40.0),
                        Container(
                          height: 150.0,
                          width: 150.0,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            image: DecorationImage(
                              image: AssetImage(
                                "images/ariana_grande_artist_photo.png"
                              ),
                              fit: BoxFit.cover
                            )
                          )
                        ),
                        const SizedBox(height: 60.0),
                        const LinearProgressIndicator(
                          minHeight: 2.0,
                          value: 0.3,
                          backgroundColor: Color.fromARGB(255, 236, 231, 231),
                          color: Color(0xFF7D9AFF),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("1:20",
                              style: durationStyle
                            ),
                            Text("4:40",
                              style: durationStyle
                            )
                          ]
                        ),
                        const SizedBox(height: 100),
                        Center(
                          child: Column(
                            children: [
                              Text(
                                song.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              const Text(
                                "Ariana Grande",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                  color: Color(0xFF7D9AFF)
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 100),
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Icon(
                                Icons.fast_rewind,
                                color: Colors.black,
                              ),
                              const SizedBox(width: 70.0),
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(),
                                  color: Colors.white,
                                ),
                                child: const Icon(
                                  Icons.pause,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(width: 70.0),
                              const Icon(
                                Icons.fast_forward,
                                color: Colors.black,
                              )
                            ]
                          ),
                        ),
                        const SizedBox(height: 50),
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(
                                Icons.volume_mute,
                                color: Colors.grey.withOpacity(0.5),
                              ),
                              Expanded(
                                child: Slider(
                                  value: 20,
                                  min: 0,
                                  max: 100,
                                  onChanged: (_) {},
                                  activeColor: Colors.black,
                                  thumbColor: Colors.black,
                                  inactiveColor: Colors.grey.withOpacity(0.5),
                                ),
                              ),
                              Icon(
                                Icons.volume_up,
                                color: Colors.grey.withOpacity(0.5),
                              ),
                            ]
                          ),
                        )
                      ]
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}