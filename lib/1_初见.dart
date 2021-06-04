import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: Text("我是标题"),
      ),
      body: Center(
        child: Text(
          "我是页面的主要内容.",
          style: TextStyle(fontSize: 30, color: Colors.red),
        ),
      ),
      ///FloatingActionButton在Scaffold里会自动位于右下角
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.ac_unit_sharp),
        onPressed: (){},
      ),
      ///Scaffold里设置FloatingActionButton的位置
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    ),
  ));
}
