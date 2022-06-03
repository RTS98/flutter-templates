import 'package:flutter/material.dart';
import 'package:news_app/blocs/get_top_headline_bloc.dart';
import 'package:news_app/models/article_response.dart';
import 'package:news_app/screens/carousel_widget.dart';
import 'package:news_app/widgets/error_widget.dart';
import 'package:news_app/widgets/loading_widget.dart';

class HeadingSliderWidget extends StatelessWidget {
  const HeadingSliderWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ArticleResponse>(
      stream: getTopHeadlinesBloc.subject,
      builder: (BuildContext context, AsyncSnapshot<ArticleResponse> snapshot){
        if(snapshot.hasData){
          if(snapshot.data!.error.isNotEmpty){
            return const CustomErrorWidget();
          }
          return CarouselWidget(articles: snapshot.data!.articles);
        }else if(snapshot.hasError){
          return const CustomErrorWidget();
        }else{
          return const LoadingWidget();
        }
      },
    );
  }
}