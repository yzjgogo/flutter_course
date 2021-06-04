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
      children: [
        NormalText(),
        SizedBox(
          height: 40,
        ),
        RichText(),
      ],
    );
  }
}

class NormalText extends StatelessWidget {
  const NormalText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "《定风波》 苏轼 莫听穿林打叶声，何妨吟啸且徐行。竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。",
      textAlign: TextAlign.end,
      //在这个Text的宽高范围内设定文本内容的对齐方法
      maxLines: 2,
      //设定Text最多显示几行，多余的直接去掉
      overflow: TextOverflow.ellipsis,
      //未显示完的在结尾显示...
      textScaleFactor: 1.5,
      //在原来1.0的基础上字体放大的倍数
      style: TextStyle(
        fontSize: 20,
        color: Colors.teal,
        fontWeight: FontWeight.bold, //加粗方式
      ),
    );
  }
}

///富文本
class RichText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
          //可以直接放一个text
          text: "直接一个文本DFSDSDFSDFSDFSD",
          style: TextStyle(color: Colors.tealAccent, fontSize: 20),
          //可以放多个InlineSpan
          children: <InlineSpan>[
            TextSpan(
              text: "第一",
              style: TextStyle(color: Colors.amber),
            ),
            TextSpan(
              text: "第二",
              style: TextStyle(color: Colors.red),
            ),
            WidgetSpan(
                child: Icon(
              Icons.flag,
              color: Colors.green,
            )),
            //支持填充widget
            TextSpan(text: "第三", style: TextStyle(color: Colors.blue))
          ]),
      textAlign: TextAlign.start,
    );
  }
}
