import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MineScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('我的'),
      ),
      body: new Center(
        child: new RaisedButton(
            child: new Text('退出登录'),
            onPressed: () {
              Navigator.of(context).pushNamed('/');
            }),
      ),
    );
  }
}
