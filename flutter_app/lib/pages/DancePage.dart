import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bean/BaseBean.dart';
import 'package:http/http.dart' as http;

//舞蹈
class DancePage extends StatefulWidget {
  _DancePageDtate createState() => _DancePageDtate();
}

class _DancePageDtate extends State<DancePage> {
  //显示返回的数据
  String showResult = '';

  //发起请求
  Future<BaseBean> getData() async {
    final response = await http.get(
        'http://192.168.0.224:8080/eolinker_os/Mock/simple?projectID=2&uri=http://www.mcl.net:8888/api/Test');
    final result = json.decode(response.body);

    return BaseBean.from(result);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('舞蹈',
            style: new TextStyle(color: Colors.white, fontSize: 26)),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 15),
            height: 50,
            child: new RaisedButton(
                color: Colors.red,
                child: new Text(
                  '点击时发起网络请求',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  //按下时发起请求
                  getData().then((BaseBean value) {
                    //重置状态
                    setState(() {
                      showResult = '请求结果：\nstatus:${value.status} '
                          '\n msg:${value.msg} '
                          '\ndata:${value.data} } ';
                    });
                  });
                }),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            alignment: Alignment.center,
            decoration: BoxDecoration(color: Colors.black),
            child: Text(
              showResult,
              style: TextStyle(color: Colors.white, fontSize: 26),
            ),
          ),
        ],
      ),
      //这个是侧边栏菜单，忽略
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
