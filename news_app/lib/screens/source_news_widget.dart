import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/screens/news_detail.dart';
import 'package:timeago/timeago.dart';

class SourceNewsWidget extends StatelessWidget {
  final List<ArticleModel> articles;
  const SourceNewsWidget({required this.articles, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (articles.isEmpty) {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget>[
            Text(
              "No more news",
              style: TextStyle(color: Colors.black45),
            ),
          ],
        ),
      );
    } else {
      return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsDetail(
                    article: articles[index],
                  )  
                )
              );
            },
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey, width: 1.0),
                ),
                color: Colors.white,
              ),
              height: 150,
              child: Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 3 / 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          articles[index].title,
                          maxLines: 3,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 14.0
                          )
                        ),
                        Expanded(
                          child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    timeUntil(
                                      DateTime.parse(articles[index].date)),
                                    style: const TextStyle(
                                      color: Colors.black26,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0
                                    )
                                  )
                                ],
                              ),
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 10.0),
                    width: MediaQuery.of(context).size.width * 2 / 5,
                    height: 130,
                    child: 
                    FadeInImage.assetNetwork(
                      alignment: Alignment.topCenter,
                      placeholder: 'assets/img/placeholder.jpg',
                      image: articles[index].img.isEmpty
                          ? "http://to-let.com.bd/operator/images/noimage.png"
                          : articles[index].img,
                      fit: BoxFit.fitHeight,
                      width: double.maxFinite,
                      height: MediaQuery.of(context).size.height * 1 / 3
                    )
                  )
                ],
              ),
            ),
          );
        }
      );
    }
  }
  String timeUntil(DateTime date) {
    return format(date, allowFromNow: true, locale: 'en');
  }
}