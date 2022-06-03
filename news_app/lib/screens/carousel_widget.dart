import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/screens/news_detail.dart';
import 'package:timeago/timeago.dart';

class CarouselWidget extends StatelessWidget {
  final List<ArticleModel> articles;
  const CarouselWidget({required this.articles, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        enlargeCenterPage: false,
        height: 200,
        viewportFraction: 0.9
      ),
      items: articles.map((article) => 
        GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => 
                NewsDetail(
                  article: article
                )
              ) 
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8.0)
                    ),
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: article.img.isEmpty 
                        ? const ExactAssetImage("assets/placeholder.jpg") as ImageProvider
                        : NetworkImage(article.img)
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8.0)
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: const <double>[0.1, 0.9],
                      colors: [
                        Colors.black.withOpacity(0.9),
                        Colors.white.withOpacity(0.0)
                      ]
                    ),
                  ),
                ),
                Positioned(
                  bottom: 30.0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    width: 250.0,
                    child: Column(
                      children: <Widget>[
                        Text(
                          article.title,
                          style: const TextStyle(
                            height: 1.5,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0
                          ),
                        ),
                      ],
                    ),
                  )
                ),
                Positioned(
                  bottom: 10.0,
                  left: 10.0,
                  child: Text(
                    article.source.name,
                    style: const TextStyle(
                      color: Colors.white54,
                      fontSize: 9.0
                    ),
                  )
                ),
                Positioned(
                  bottom: 10.0,
                  right: 10.0,
                  child: Text(
                    timeUntil(DateTime.parse(article.date)),
                    style: const TextStyle(
                      color: Colors.white54,
                      fontSize: 9.0
                    ),
                  )
                ),
              ],
            ),
          ),
        )
      ).toList(),
    );
  }
  
  String timeUntil(DateTime date) {
    return format(date, allowFromNow: true, locale: 'en');
  }
}