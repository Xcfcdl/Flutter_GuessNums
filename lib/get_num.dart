import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '猜大小', //应用名称
      theme: ThemeData(
          // This is the theme of your application.
          //应用主题
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.lightBlue),
      home: MyHomePage(),
    );
  }
}

//var _a = Random().nextInt(max);
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> waitingList = [10, 100, 1000];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('猜大小'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              '你想玩多大的？',
              style: TextStyle(fontSize: 50.0),
            ),
            ListView.builder(
              itemCount: waitingList.length,
              itemBuilder: (context, index) {
                return RaisedButton(
                    child: Text('$waitingList[index]'),
                    onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  GuessPage(waitingList[index])),
                        ));
              },
            )
          ],
        ),
      ),
    );
  }
}

class GuessPage extends StatefulWidget {
  var max; //范围
  var nums; //生成的数字
  GuessPage(this.max);

  @override
  _GuessPageState createState() => _GuessPageState();
}

class _GuessPageState extends State<GuessPage> {
  final TextEditingController _controller = new TextEditingController();
  List<String> resultText = ['', '猜大了', '猜小了', '恭喜你，猜对了！'];
  var _index = 0;

  int getNum(int max) {
    return Random().nextInt(max);
  }

  @override
  void initState() {
    //初始化一个数字
    super.initState();
    widget.nums = getNum(widget.max);
  }

  resetNum() {
    widget.nums = getNum(widget.max);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
              height: 100.0,
              decoration: BoxDecoration(
                  border: Border.all(width: 5.0, color: Colors.blueAccent)),
              child: Text('${resultText[_index]}',
                  style: TextStyle(fontSize: 25.0))),
          Text('已生成一个${widget.max}以内的数字，你猜它多大？'),
          Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: '请输入一个${widget.max}以内的数字',
                  ),
                ),
              ),
              RaisedButton(
                child: Text(
                  '确认',
                  style: TextStyle(fontSize: 25.0),
                ),
                onPressed: () {
                  var re;
                  var re2 = int.parse(_controller.text);
                  if (re2 == widget.nums) {
                    re = 3;
                  } else if (re2 > widget.nums) {
                    re = 1;
                  } else if (re2 < widget.nums) {
                    re = 2;
                  }
                  setState(() {
                    //比对中
                    _index = re;
                  });
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
