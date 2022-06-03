import 'package:flutter/material.dart';
import 'package:news_app/screens/top_channels_widget.dart';
import 'package:news_app/widgets/heading_slider_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        const HeadingSliderWidget(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: const <Widget>[
              Text(
                "Top channels",
                style: TextStyle(
                  color:  Color(0xFFE5E5E5),
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0
                ),
              ),
            ],
          ),
        ),
        TopChannelsWidget(),
        
      ],
    );
  }
}