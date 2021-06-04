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

///子类extends StatefulWidget必须重写其createState()方法，用于创建State
///无论是StatelessWidget还是StatefulWidget都是Widget，都是不可变的，Widget被@immutable修饰
///因此他们所有的属性都必须用final修饰
class MyContent extends StatefulWidget {
  // var mData = 1; 会警告
  // final mData = 1;不会警告
  @override
  _MyContentState createState() {
    return _MyContentState();
  }
}

class _MyContentState extends State<MyContent> {
  var flag = false;

  @override
  Widget build(BuildContext context) {
    print("执行_MyContentState的build");
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
            value: flag,
            onChanged: (result) {
              print("执行onChange*:${result}");
              ///setState()会触发_MyContentState的build()重新执行，然后flag会改变，因此执行到Checkbox又会将flag重新给value；
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
