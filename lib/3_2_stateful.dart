import 'package:flutter/material.dart';

///State访问StatefulWidget里的数据
void main() {
  runApp(_MyApp());
}

class _MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: _MyHomePage());
  }
}

class _MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我是标题"),
      ),
      body: _MyContent("我是StatefulWidget,我带着信息呢"),
    );
  }
}

class _MyContent extends StatefulWidget {
  final msg;

  _MyContent(this.msg);

  @override
  __MyContentState createState() {
    return __MyContentState();
  }
}

///State<_MyContent>里持有_MyContent的实例,放到widget属性里，因此可以通过widget访问_MyContent的数据
class __MyContentState extends State<_MyContent> {
  int _count = 0;

  void doPlus() {
    setState(() {
      ++_count;
    });
  }

  void doMinus() {
    setState(() {
      --_count;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                child: Text("+"),
                onPressed: doPlus,
              ),
              RaisedButton(
                child: Text("-"),
                onPressed: doMinus,
              ),
            ],
          ),
          Text("当前数值是:$_count"),
          Text("访问_MyContent的数据:${widget.msg}")//访问StatefulWidget里的数据，widget就是那个StatefulWidget
        ],
      ),
    );
  }
}
