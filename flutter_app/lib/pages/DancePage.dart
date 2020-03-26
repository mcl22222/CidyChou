import 'dart:convert';
import 'dart:io';

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

  //另一种请求方法
  Future<BaseBean> getData() async {
    final response = await http.get(
        'http://192.168.0.224:8080/eolinker_os/Mock/simple?projectID=2&uri=http://www.mcl.net:8888/api/Test');
    final result = json.decode(response.body);

    return BaseBean.from(result);
  }

  var _ipAddress = 'Unknown';

  //官网的请求方法
  Future<BaseBean> _getHttpData() async {
    var url =
        'http://192.168.0.224:8080/eolinker_os/Mock/simple?projectID=2&uri=http://www.mcl.net:8888/api/Test';
    var httpClient = new HttpClient();
    String result;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        var json = await response.transform(utf8.decoder).join();
        var data = jsonDecode(json); //此时的data就是服务器返回的一整条json
        result = data['msg']; //获取里面的msg
      } else {
        result =
            'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address';
    }
    if (!mounted) return null;
    setState(() {
      _ipAddress = result;
    });
  }

  //监听输入框的文字变化
  static TextEditingController _spController = new TextEditingController();

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
                  '另一种HTTPS的Get请求',
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
            height: 50,
            child: new RaisedButton(
              color: Colors.red,
              child: new Text(
                '官网HTTPS的Get请求',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              onPressed: _getHttpData,
            ),
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
          Container(
            margin: EdgeInsets.only(top: 15),
            alignment: Alignment.center,
            decoration: BoxDecoration(color: Colors.black),
            child: Text(
              _ipAddress,
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
