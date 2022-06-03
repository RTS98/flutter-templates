import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:news_app/models/article_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:timeago/timeago.dart';

class NewsDetail extends StatefulWidget {
  final ArticleModel article;
  const NewsDetail({required this.article, Key? key}) : super(key: key);

  @override
  State<NewsDetail> createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GestureDetector(
        onTap: () => launchUrl(Uri.parse(widget.article.url)),
        child: Container(
          height: 48.0,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.white,
            gradient: LinearGradient(
              colors: [Color(0xFFf6501c), Color(0xFFff7e00)],
              stops: [0.0, 1.0],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              Text(
                "Read More", 
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0
                ),
              ),
            ],
          ),
        )
      ),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xff191826),
        title: Text(
          widget.article.title,
          style: const TextStyle(
            fontSize: 17.0,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 16/9,
            child: FadeInImage.assetNetwork(
              alignment: Alignment.topCenter,
              placeholder: 'assets/placeholder.jpeg',
              fit: BoxFit.cover,
              width: double.maxFinite,
              height:  MediaQuery.of(context).size.height * 1/3,
              image: widget.article.img.isNotEmpty 
                ? "http://to-let.com.bd/operator/images/noimage.png"
                : widget.article.img
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      widget.article.date.substring(0, 10), 
                      style: const TextStyle(
                        color: Color(0xff191826),
                        fontWeight: FontWeight.bold
                      )
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  widget.article.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20.0
                  )
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  timeUntil(DateTime.parse(widget.article.date)), 
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Html(
                  data: widget.article.content,
                  //style: {"style" : Style(fontSize: FontSize.medium, color: Colors.black)}
                  
                ) 
              ],
            ),
          )
        ],
      ),
    );
  }
  
  String timeUntil(DateTime date) {
    return format(date, allowFromNow: true);
  }
}
