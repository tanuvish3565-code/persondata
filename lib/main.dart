import 'package:flutter/material.dart';
import 'HomePage.dart';

void main(){
  runApp(Myapp());
}

class Myapp extends StatelessWidget{

  

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Server Task",
      home: HomePage(),
    );
  }
}