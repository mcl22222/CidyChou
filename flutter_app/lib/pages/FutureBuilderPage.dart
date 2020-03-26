import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bean/BaseBean.dart';
import 'package:http/http.dart' as http;

//FutureBuilder的使用
class FutureBuilderPage extends StatefulWidget {
  @override
  _FutureBuilderPageState createState() => _FutureBuilderPageState();
}

class _FutureBuilderPageState extends State<FutureBuilderPage> {
  String showResult = '';

  Future<BaseBean> getData() async {
    final response = await http.get(
        'http://192.168.0.224:8080/eolinker_os/Mock/simple?projectID=2&uri=http://www.mcl.net:8888/api/Test');
    Utf8Decoder utf8decoder = Utf8Decoder(); //中文乱码
    var result = json.decode(utf8decoder.convert(response.bodyBytes));
    return BaseBean.from(result);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder<BaseBean>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<BaseBean> snapshot) {
            //连接状态
            switch (snapshot.connectionState) {
              //无连接
              case ConnectionState.none:
                return new Container(
                  alignment: Alignment.center,
                  child: Text("没有连接"),
                );

              //等待
              case ConnectionState.waiting:
                return new Center(
                  child: new CircularProgressIndicator(),
                );

              //正在执行
              case ConnectionState.active:
                return new Container(
                  alignment: Alignment.center,
                  child: Text("正在执行ing"),
                );

              //执行完成
              case ConnectionState.done:
                //出错了，显示出错信息
                if (snapshot.hasError) {
                  return new Container(
                    alignment: Alignment.center,
                    child: Text(
                      '${snapshot.error}',
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                } else {
                  return new Container(
                    margin: EdgeInsets.only(top: 20),
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        Text('status:${snapshot.data.status}'),
                        Text('msg:${snapshot.data.msg}'),
                        Text('data:${snapshot.data.data}')
                      ],
                    ),
                  );
                }
            }
          },
        ),
      ),
    );
  }
}
