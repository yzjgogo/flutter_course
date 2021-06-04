import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
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
      appBar: AppBar(
        title: Text("我是标题"),
      ),
      body: MyContent(),
    );
  }
}

class MyContent extends StatefulWidget {
  // var mData = 1; 会警告
  // final mData = 1;不会警告
  MyContent(){
    print("1.执行StatefulWidget的构造器");
  }
  @override
  _MyContentState createState() {
    print("2.执行StatefulWidget的createState");
    return _MyContentState();
  }
}

class _MyContentState extends State<MyContent> {
  var flag = false;
  _MyContentState(){
    print("3.执行State的构造器");
  }
  @override
  void initState() {
    print("4.执行State的initState");
    super.initState();
  }
  @override
  void didChangeDependencies() {
    print("5.执行State的didChangeDependencies");
    super.didChangeDependencies();
  }
  @override
  void didUpdateWidget(covariant MyContent oldWidget) {
    print("7.执行State的didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }
  @override
  void setState(VoidCallback fn) {
    print("8.执行State的setState");
    super.setState(fn);
  }
  @override
  void dispose() {
    print("9.执行State的dispose");
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    print("6.执行State的build");
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
            value: flag,
            onChanged: (result) {
              setState(() {
                flag = result!;
              });
            },
          ),
          Text("这是一个选项")
        ],
      ),
    );
  }
}
