import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//shared_preferences本地数据存取简单、异步、持久化
class SharedPreferencesPage extends StatefulWidget {
  _SharedPreferencesPageState createState() => _SharedPreferencesPageState();
}

class _SharedPreferencesPageState extends State<SharedPreferencesPage> {
  String putStr = ''; //存的数据
  String getStr = ''; //取的数据
  String strKey = 'strKey'; //存或取的key
  //判断输入的内容是否为空
  static bool _stateSp = false;

  //用于弹框消失时
  static BuildContext context1;

  //监听输入框的文字变化
  static TextEditingController _spController = new TextEditingController();

  //账号输入框样式
  static Widget buildAccountTextFied(TextEditingController controller) {
    return TextField(
      //键盘的样式
      keyboardType: TextInputType.text,
      //监听
      controller: controller,
      //最大长度
      maxLength: 30,
      //颜色跟hintColor
      //最大行数
      maxLines: 1,
      //是否自动更正
      autocorrect: true,
      //是否自动化对焦
      autofocus: false,
      //文本对齐方式
      textAlign: TextAlign.start,
      //输入文本的样式
      style: TextStyle(fontSize: 20, color: Colors.black),
      decoration: InputDecoration(
        //聚焦时才显示,颜色跟hintColor
        hintText: '请输入存储数据',
      ),
    );
  }

  //账号、密码输入框
  Widget textSection = new Container(
    padding: const EdgeInsets.only(left: 32, right: 32),
    child: new Column(
      //主轴Flex的值
      mainAxisSize: MainAxisSize.max,
      //MainAxisAlignment：主轴方向上的对齐方式，会对child的位置起作用
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        buildAccountTextFied(_spController),
      ],
    ),
  );

  //封装好的button控件
  Widget buttons(String name) {
    return new Container(
      alignment: Alignment.centerLeft,
      height: 50,
      margin: EdgeInsets.all(32),
      color: Colors.red,
      child: new Text(
        name,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  static Widget getDialog(String msg) {
    return new AlertDialog(
      title: new Text(
        '温馨提示',
        style: new TextStyle(color: Colors.red[250], fontSize: 18),
      ),
      content: new Text(
        msg,
        style: new TextStyle(color: Colors.red, fontSize: 20),
      ),
      actions: <Widget>[
        new FlatButton(
            //扁平的button
            onPressed: () {
              Navigator.of(context1).pop(); //弹窗消失
            },
            child: new Text(
              '取消',
              style: new TextStyle(color: Colors.blue, fontSize: 18),
            )),
        new RaisedButton(
            //凸起的button
            onPressed: () {
              Navigator.of(context1).pop(); //弹窗消失
            },
            child: new Text(
              '确定',
              style: new TextStyle(color: Colors.blue, fontSize: 18),
            ))
      ],
    );
  }

  //校验存储的数据是否为null
  static void _checkSp() {
    if (_spController.text.isNotEmpty) {
      _stateSp = true;
    } else {
      _stateSp = false;
    }
  }

  //存数据
  _putSp() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    //把有修改的视图重新绘制一遍
    setState(() {
      putStr = _spController.text.toString(); //获取TextField输入的内容
    });
    //保存String类型，还有int、Double、List<String>、Bool（动态类型）
    await sp.setString(strKey, putStr);
  }

  //获取数据
  _getSp() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    //把有修改的视图重新绘制一遍
    setState(() {
      /*
      * 获取String类型，还有int、Double、List<String>、Bool（动态类型）；
      * 获取动态类型时：sp.getBool(strKey) as String需要在后面加上“as 具体类型”
      * */
      getStr = sp.getString(strKey).toString();
      print('取出来的：' + getStr);
    });
  }

  @override
  Widget build(BuildContext context) {
    context1 = context;
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: new ListView(
        children: <Widget>[
          textSection,
          RaisedButton(
              onPressed: () {
                _checkSp();
                if (_stateSp) {
                  //存储的数据不为null，那么存储
                  _putSp();
                } else {
                  //存储数据为null，那么弹窗提示用户
                  showDialog(
                    context: context1,
                    barrierDismissible: true, //点击弹窗外部是否消失
                    child: getDialog('存储的数据不能为空！'),
                  );
                }
              },
              child: Text('存数据')),
          buttons('存储的内容：' + putStr),
          RaisedButton(onPressed: _getSp, child: Text('获取数据')),
          buttons('获取的结果:' + getStr),
        ],
      ),
    ));
  }
}
