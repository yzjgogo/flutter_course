import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("按钮进阶"),),
      body: MyContent(),
    );
  }
}
class MyContent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FlatButton(
          color: Colors.green,
          child: Text("."),
          onPressed: (){},
        ),
      ],
    );
  }
}


