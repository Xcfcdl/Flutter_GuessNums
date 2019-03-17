import 'package:flutter/material.dart';
import 'guess_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> waitingList = [10, 100, 1000];
  var _color = Colors.amber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        leading: Icon(Icons.games),
        title: Text('猜大小'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          
          children: <Widget>[
            Divider(height: 100.0,),
            Center(
              child: Text(
                '你想玩多大的？',
                style: TextStyle(fontSize: 50.0),
              ),
            ),
            Divider(
              height: 100.0,
            ),
            //Container(height: 100.0,),
            Row(
              children: <Widget>[
                Container(
                  width: 10.0,
                ),
                Expanded(
                  child: RaisedButton(
                    color: _color,
                      shape: StadiumBorder(),
                      elevation: 10.0,
                      child: Text('${waitingList[0]}',style: TextStyle(fontSize: 25.0),),
                      onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    GuessPage(max: waitingList[0])),
                          )),
                ),
                Container(
                  width: 10.0,
                ),
                Expanded(
                  child: RaisedButton(
                    color: _color,
                      shape: StadiumBorder(),
                      elevation: 10.0,
                      child: Text('${waitingList[1]}',style: TextStyle(fontSize: 25.0),),
                      onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    GuessPage(max: waitingList[1])),
                          )),
                ),
                Container(
                  width: 10.0,
                ),
                Expanded(
                  child: RaisedButton(
                    color: _color,
                      shape: StadiumBorder(),
                      elevation: 10.0,
                      child: Text('${waitingList[2]}',style: TextStyle(fontSize: 25.0),),
                      onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    GuessPage(max: waitingList[2])),
                          )),
                ),Container(
                  width: 10.0,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
