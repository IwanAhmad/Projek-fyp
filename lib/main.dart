import 'package:flutter/material.dart';
import 'Secondpage.dart';


void main(){
 runApp(new MaterialApp(
   title: "Page Navigation",
   home: Firstpage(),
 ));
}

class Firstpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("I-Harvest")),
      body: Center(
        child:RaisedButton(onPressed: (){
             Navigator.push(context, MaterialPageRoute(
               builder: (context)=>Secondpage()
               ));
        },
        child: Text('Current price'),
        )
      ),
    );
  }
}