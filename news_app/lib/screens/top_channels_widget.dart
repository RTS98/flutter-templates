import 'package:flutter/material.dart';
import 'package:news_app/blocs/get_sources_bloc.dart';
import 'package:news_app/models/source_response.dart';
import 'package:news_app/screens/sources_widget.dart';

class TopChannelsWidget extends StatefulWidget {
  const TopChannelsWidget({ Key? key }) : super(key: key);

  @override
  State<TopChannelsWidget> createState() => _TopChannelsWidgetState();
}

class _TopChannelsWidgetState extends State<TopChannelsWidget> {
  
  @override
  void initState() {
    super.initState();
    getSourcesBloc.getSources();
  }
  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SourceResponse>(
      stream: getSourcesBloc.subject.stream,
      builder: (context, AsyncSnapshot<SourceResponse> snapshot){
        if(snapshot.hasData){
          if(snapshot.data!.error.isNotEmpty){
            return Container();
          }
          return SourcesWidget(sources: snapshot.data!.sources);
        }else if(snapshot.hasError){
          return Container();
        }else{
          return Container();
        }
      },
    );
  }
}