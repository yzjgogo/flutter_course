import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("文本和富文本"),
      ),
      body: _MyContent(),
    );
  }
}

class _MyContent extends StatefulWidget {
  @override
  __MyContentState createState() => __MyContentState();
}

class __MyContentState extends State<_MyContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ///RaiseButton有凸起的立体效果
        RaisedButton(
          child: Text("RaisedButton"),
            textColor: Colors.white,
            color: Colors.purple,
            onPressed: (){print("RaisedButton被点击");}
        ),
        ///扁平的Button，没有立体效果
        FlatButton(
          child: Icon(Icons.ac_unit_sharp,color: Colors.tealAccent,),
            color: Colors.orange,
            onPressed: (){print("FlatButton被点击");}
        ),
        ///四周默认有线的Button
        OutlineButton(
          child: Text("OutlineButton"),
            onPressed: (){print("OutlineButton被点击");}
        ),
        ///参考1_初见.dart
        FloatingActionButton(
          child: Icon(Icons.zoom_in_sharp),
            onPressed: (){print("FloatingActionButton被点击");}
        ),
        ///自定义按钮
        FlatButton(
          color: Colors.amberAccent,
          //shape(ShapeBorder)用于定义按钮的四个角，RoundedRectangleBorder是ShapeBorder的具体子类,BorderRadius是BorderRadiusGeometry(borderRadius)的具体子类
          shape: RoundedRectangleBorder(
              borderRadius:BorderRadius.circular(8)
          ),
          child: Row(
            //因为Row默认占一整行(一个屏幕那么宽)，所有用MainAxisSize.min改变默认值，实现包裹内容
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.flag),
              Text("去学习")
            ],
          ),
          onPressed: (){},
        ),
      ],
    );
  }
}
