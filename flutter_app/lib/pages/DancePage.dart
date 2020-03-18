import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//舞蹈
class DancePage extends StatefulWidget {
  _DancePageDtate createState() => _DancePageDtate();
}

class _DancePageDtate extends State<DancePage> {
  //自定义字体
  final textStyle = const TextStyle(
    fontFamily: 'Chu',
    color: Colors.red,
    fontSize: 20,
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('舞蹈', style: textStyle),
      ),
      body: Center(
        child: Text('一起来Dance'),
      ),
      drawer: Drawer(
        elevation: 500,
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                '侧滑标题栏',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              decoration: BoxDecoration(color: Colors.black), //头部装饰
            ),
            ListTile(
              title: Text(
                '哎呀妈妈呀',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(), //分割线
            ListTile(
              title: Text(
                '沙哈黧黑',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(), //分割线
            ListTile(
              title: Text(
                '啥我滴卡',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(), //分割线
          ],
        ),
      ),
    );
  }
}
