import 'package:flutter/material.dart';
import 'package:sleep_dashboard/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'SF Pro Text',
        iconTheme: const IconThemeData(
          color: Colors.white
        )
      ),
      debugShowCheckedModeBanner: false,
      home: const Dashboard(),
    );
  }
}