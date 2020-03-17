import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/state/FavoriteWidget.dart';
import 'package:flutter_app/state/Counter.dart';

class FlutterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _FlutterScreenState();
  }
}

@override
class _FlutterScreenState extends State<FlutterScreen> {
  Widget build(BuildContext context) {
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: [
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start, //子项左对齐
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0), //底部添加8像素填充
                  child: new Text(
                    'Oeschinen Lake Campground',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Text(
                  'Kandersteg, Switzerland',
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          new FavoriteWidget(),
//          new Icon(
//            Icons.star,
//            color: Colors.red[500],
//          ),
//          new Text('41'),
        ],
      ),
    );

    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;

      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Icon(icon, color: color),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          )
        ],
      );
    }

    Widget buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, //平均的分配每个列占据的行空间
        children: [
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = new Container(
      padding: const EdgeInsets.all(32), //每条边添加32像素
      child: new Text(
        '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true, //文本是否应在软换行符（例如句点或逗号）之间断开
      ),
    );

    Widget iconSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Expanded(child: new Image.asset('images/lake.jpg')),
          new Expanded(flex: 2, child: new Image.asset('images/lake.jpg')),
          new Expanded(child: new Image.asset('images/lake.jpg'))
        ],
      ),
    );

    Widget imagesSection = new Container(
      decoration: new BoxDecoration(
        color: Colors.black26,
      ),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Container(
              decoration: new BoxDecoration(
                border: new Border.all(width: 10.0, color: Colors.black38),
                borderRadius:
                    const BorderRadius.all(const Radius.circular(8.0)),
              ),
              margin: const EdgeInsets.all(4.0),
              child: new Image.asset('images/lake.jpg'),
            ),
          ),
          new Expanded(
            child: new Container(
              decoration: new BoxDecoration(
                border: new Border.all(width: 10.0, color: Colors.black38),
                borderRadius:
                    const BorderRadius.all(const Radius.circular(8.0)),
              ),
              margin: const EdgeInsets.all(4.0),
              child: new Image.asset('images/lake.jpg'),
            ),
          ),
        ],
      ),
    );

    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('mcl'),
        ),
        body: new ListView(
          children: [
            new Image.asset(
              'images/lake.jpg',
              width: 600.0,
              height: 240.0,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
            iconSection,
            imagesSection,
            new Counter(),
          ],
        ),
      ),
    );
  }
}
