import 'package:flutter/material.dart';
import 'package:news_app/models/source_model.dart';
import 'package:news_app/screens/source_detail.dart';

class SourcesWidget extends StatelessWidget {
  final List<SourceModel> sources;
  const SourcesWidget({required this.sources, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(sources.isEmpty){
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget>[
            Text(
              "No More Sources",
              style: TextStyle(color: Colors.black45),
            )
          ]
        ),
      );
    } else {
      return SizedBox(
        height: 115.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: sources.length,
          itemBuilder: (context, index){
            return Container(
              padding: const EdgeInsets.only(top: 10.0),
              width: 80.0,
              child: GestureDetector(
                onTap: () { 
                   Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SourceDetail(
                        source: sources[index],
                      ),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Hero(
                      tag: sources[index].id,
                      child: Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5.0,
                              spreadRadius: 1.0,
                              offset: Offset(1.0, 1.0),
                            )
                          ],
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              "assets/logos/${sources[index].id}.png")
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      sources[index].name,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        height: 1.4,
                        color: Color(0xFFE5E5E5),
                        fontWeight: FontWeight.bold,
                        fontSize: 10.0
                      ),
                    ),
                    const SizedBox(
                      height: 3.0,
                    ),
                    Text(
                      sources[index].category,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        height: 1.4,
                        color: Color(0xFFE5E5E5),
                        fontWeight: FontWeight.bold,
                        fontSize: 9.0
                      ),
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
}