import 'package:flutter/material.dart';
import 'package:news_app/blocs/get_new_sources_bloc.dart';
import 'package:news_app/models/article_response.dart';
import 'package:news_app/models/source_model.dart';
import 'package:news_app/screens/source_news_widget.dart';
import 'package:news_app/widgets/loading_widget.dart';

class SourceDetail extends StatefulWidget {
  final SourceModel source;
  
  const SourceDetail({required this.source, Key? key }) : super(key: key);

  @override
  State<SourceDetail> createState() => _SourceDetailState();
}

class _SourceDetailState extends State<SourceDetail> {
  
  @override
  void initState() {
    super.initState();
    getSourceNewsBloc.getSourceNews(widget.source.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0),
        child: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          centerTitle: false,
          elevation: 0.0,
          backgroundColor: const Color(0xFF191826),
          title: const Text(
           "",
          )
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
            color: const Color(0xFF191826),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                Hero(
                  tag: widget.source.id,
                    child: SizedBox(
                    height: 80.0,
                    width: 80.0,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 2.0, color: Colors.white),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("assets/logos/${widget.source.id}.png"),
                          fit: BoxFit.cover
                        )
                      ),
                    )
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  widget.source.name, 
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  widget.source.description, 
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                )
              ]
            ),
          ),
          Expanded(
            child: StreamBuilder<ArticleResponse>(
              stream: getSourceNewsBloc.subject.stream,
              builder: (context, AsyncSnapshot<ArticleResponse> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.error.isEmpty) {
                    return Container();
                  }
                  return SourceNewsWidget(articles: snapshot.data!.articles);
                } else if (snapshot.hasError) {
                  return Container();
                } else {
                  return const LoadingWidget();
                }
              },
            )
          )
        ]
      ),
    );
  }

  @override
  void dispose() {
    getSourceNewsBloc.drainStream();
    super.dispose();
  }
}