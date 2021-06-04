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
        title: Text("图片"),
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
        //使用NetworkImage
        ImageDemo(),
        //命名构造器从assets中访问图片
        Image.asset("assets/images/juren.jpeg"),
        //使用AssetImage
        Image(image: AssetImage("assets/images/tupian4.jpg"),)
      ],
    );
  }
}
class ImageDemo extends StatelessWidget {
  final String imageUrl = "http://tiebapic.baidu.com/forum/w%3D580%3B/sign=28b12b0272380cd7e61ea2e5917faf34/cf1b9d16fdfaaf516b11550d9b5494eef11f7a96.jpg";
  @override
  Widget build(BuildContext context) {
    return Image(
      //Image的每一个像素都用这个颜色填充，不是背景色的意思
      // color: Colors.green,
      //指定什么color与每一个像素混合的模式
      // colorBlendMode: BlendMode.colorDodge,
      image: NetworkImage(imageUrl),
      width: 300,
      height: 200,
      fit: BoxFit.contain,//fill填充满，contain不满的方向居中
      // repeat: ImageRepeat.repeatX,//没填充满的部分，怎么覆盖，取原图的哪个部位覆盖
      // alignment: Alignment.bottomLeft,
      alignment: Alignment(-1,0),//Image的中心是原点，X向右为正，Y向下为正，范围是(-1,1)
    );
  }
}


