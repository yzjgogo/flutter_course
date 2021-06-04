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
        title: Text("商品列表"),
      ),
      body: MyContentPage(),
    );
  }
}

class MyContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductItemWidget("Apple1", "Macbook1",
            "https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg"),
        SizedBox(
          height: 10,
        ), //调整间距，类似margin
        ProductItemWidget("Apple2", "Macbook2",
            "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imm9u5zj30u00k0adf.jpg"),
        SizedBox(
          height: 10,
        ),
        ProductItemWidget("Apple3", "Macbook3",
            "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imqlouhj30u00k00v0.jpg")
      ],
    );
  }
}

class ProductItemWidget extends StatelessWidget {
  final title;
  final desc;
  final img_url;

  ProductItemWidget(this.title, this.desc, this.img_url);

  @override
  Widget build(BuildContext context) {
    return Container(
      ///padding在decoration的里面，decoration在最外面
      padding: EdgeInsets.all(20), //给这个Container容器设置四周的padding
      decoration:
          BoxDecoration(border: Border.all(color: Colors.teal, width: 10)),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.end,//横向靠右测
        // crossAxisAlignment: CrossAxisAlignment.center,//横向居中
        children: [Text(title), Text(desc), Image.network(img_url)],
      ),
    );
  }
}
