import 'package:flutter/material.dart';
import 'package:myfirsttime/views/home.dart';


class Secondpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'This will be the price',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}