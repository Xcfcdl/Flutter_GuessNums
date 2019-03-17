import 'package:flutter/material.dart';
import 'dart:math';

class GuessPage extends StatefulWidget {
  int max; //范围//生成的数字
  GuessPage({Key key, @required this.max}) : super(key: key);

  @override
  _GuessPageState createState() => _GuessPageState();
}

class _GuessPageState extends State<GuessPage> {
  final TextEditingController _controller = new TextEditingController();
  List<String> resultText = ['猜猜猜', '猜大了', '猜小了', '恭喜你，猜对了！'];
  int time = 0;
  var buttontext = ['确认','重来'];
  var buttonState = true;
  var _index = 0;
  var _width;
  var nums;
  //bool done = false;
  var _color = Colors.amber;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  int getNum(int max) {
    return Random().nextInt(max);
  }

  @override
  void initState() {
    //初始化一个数字
    super.initState();
    nums = getNum(widget.max);
    print('初始化一个数字：'+nums.toString());
  }

  resetNum() {
    buttonState = true;
    _index = 0;
    nums = getNum(widget.max);
    print('重置一个数字：'+nums.toString());
    setState(() {
      time = 0;
    });
  }
  _displaySnackBar(BuildContext context) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text('请正确输入 0~${widget.max} 之内的数字。'),
      ),
    );
  }

  _conpare() {
    int re;
    var re2 = int.tryParse(_controller.text);
    //print(re2);
    //print(re2.runtimeType);
    //_displaySnackBar(context);
    if(re2.runtimeType == Null || re2 > widget.max || re2 < 0){_displaySnackBar(context);return 0;}
    if (re2 == nums) {
      re = 3;
      buttonState =false;
      //print(resultText[re]);
    } else if (re2 > nums) {
      re = 1;
      //print(resultText[re]);
    } else if (re2 < nums) {
      re = 2;
      //print(resultText[re]);
    }
    setState(() {
      time++;
      //比对中
      _index = re;
      //print(_index.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: _color,
        title: Text('猜猜看'),
      ),
      body: Container(
        //padding: EdgeInsets.all(5.0),
        margin: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
                height: 100.0,
                width: _width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(width: 5.0, color: _color)),
                child: Text('${resultText[_index]}',
                    style: TextStyle(fontSize: 30.0,color: buttonState?_color:Colors.redAccent))),
            Divider(height: 50.0,),
            Text(
              '已生成一个${widget.max}以内的数字，你猜它多大？',
              style: TextStyle(fontSize: 25.0,color: Colors.black87),
            ),
            Text('你已经猜了 $time 次。'),
            Divider(height: 50.0,),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    //enableInteractiveSelection: done,
                    //enabled: done,
                    
                    autofocus: true,
                    enabled:buttonState,
                    controller: _controller,
                    style: TextStyle(fontSize: 20.0),
                    //textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide(color: _color,width: 5.0),borderRadius: BorderRadius.all(Radius.circular(10.0))),
                      hintText: '请输入一个${widget.max}以内的数字',
                    ),
                  ),
                ),
                Container(width: 10.0,),
                RaisedButton(
                  
                  //shape: RoundedRectangleBorder(side:  BorderSide(color: Colors.blueAccent),borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  shape: StadiumBorder(),
                  padding: EdgeInsets.fromLTRB(20.0,10.0,20.0,10.0),
                  elevation: 10.0,
                  splashColor: Colors.blueAccent,
                  color: Colors.amber,
                  child: Text(
                    buttonState?buttontext[0]:buttontext[1],
                    style: TextStyle(fontSize: 25.0),
                  ),
                  onPressed: buttonState?()=>_conpare():()=>resetNum()
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
