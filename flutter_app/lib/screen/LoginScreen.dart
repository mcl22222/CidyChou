import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() {
    return new _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  //用于登录时判断输入的账号、密码是否符合要求
  static bool _accountState, _passwordState = false;

  //提示语
  static String _checkHint;

  //监听账号输入框的文字变化
  static TextEditingController _accountController = new TextEditingController();

  //监听密码输入框的文字变化
  static TextEditingController _passwordController =
      new TextEditingController();

//用于路由（就是界面的跳转），当跳转的事件没有写在build里面时用到（我这里抽到了loginButton里面）
  static BuildContext context1;

  //校验账号是否符合条件
  static void _checkAccount() {
    //校验账号不为空且长度大于7(自定义校验条件)
    if (_accountController.text.isNotEmpty &&
        _accountController.text.trim().length > 7) {
      _accountState = true;
    } else {
      _accountState = false;
    }
  }

  //校验密码是否符合条件
  static void _checkPassword() {
    //校验密码不为空且长度大于8小于等于15(自定义校验条件)
    if (_passwordController.text.isNotEmpty &&
        _passwordController.text.length > 8 &&
        _passwordController.text.length <= 15) {
      _passwordState = true;
    } else {
      _passwordState = false;
    }
  }

  //账号输入框样式
  static Widget buildAccountTextFied(TextEditingController controller) {
    /**
     *需要定制一下某些颜色时返回Theme，不需要时返回TextField（如后面的密码）
     * 修改输入框颜色：没有获取焦点时为hintColor，获取焦点后为：primaryColor
     */
    return Theme(
      data: new ThemeData(
          primaryColor: Colors.amber, hintColor: Colors.greenAccent),
      child: new TextField(
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
        //是否是密码格式(输入的内容不可见)
        obscureText: false,
        //文本对齐方式
        textAlign: TextAlign.start,
        //输入文本的样式
        style: TextStyle(fontSize: 20, color: Colors.black),
        //允许输入的格式(digitsOnly数字)
        inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
        //内容改变回调
        onChanged: (account) {
//          print('change $account');
        },
        //提交触发回调
        onSubmitted: (account) {
//          print('submit $account');
        },
        //是否禁用
        enabled: true,
        decoration: InputDecoration(
            fillColor: Colors.blue[50],
            //底色
            filled: true,
            //有聚焦，labelText就会缩小到输入框左上角，颜色primaryColor，没聚焦前颜色跟hintColor
            labelText: '账号',
            //聚焦时才显示,颜色跟hintColor
            hintText: '请输入账号',
            //红色
//            errorText: '输入错误',
            //红色，现在在输入框的左下角，跟errorText位置一样(优先显示errorText)
//            helperText: 'acount',
            //输入框内左侧，有聚焦，颜色跟primaryColor
            prefixIcon: Icon(Icons.person),
            //输入框左侧的widget（可是text、icon……）
            icon: Text(
              '账号：',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            //输入框内右侧的widget
            suffixIcon: Icon(Icons.account_circle),
//            有聚焦显示颜色跟hintColor，显示在输入框的右边
            suffixText: "后缀",
            contentPadding: EdgeInsets.all(5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(21.11), //边框裁剪成11.11°角
              borderSide: BorderSide(
                  color: Colors.black,
                  width: 25.0), //边框颜色、大小没有效果，所以使用返回的是Theme，
            )),
      ),
    );
  }

  //密码输入框样式
  static Widget buildPasswordTextFied(TextEditingController controller) {
    return TextField(
      //键盘的样式
      keyboardType: TextInputType.number,
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
      //是否是密码格式(输入的内容不可见)
      obscureText: true,
      //文本对齐方式
      textAlign: TextAlign.start,
      //输入文本的样式
      style: TextStyle(fontSize: 20, color: Colors.black),
      //允许输入的格式(digitsOnly数字)
      inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
      //内容改变回调
      onChanged: (password) {
//        print('change $password');
      },
      //提交触发回调
      onSubmitted: (password) {
//        print('submit $password');
      },
      //是否禁用
      enabled: true,
      decoration: InputDecoration(
          //底色配合filled：true才有效
          fillColor: Colors.blue[50],
          filled: true,
          //输入聚焦以后，labelText就会缩小到输入框左上角，红色,没聚焦前颜色跟hintColor
          labelText: '密码',
          //聚焦时才显示,颜色跟hintColor
          hintText: '请输入密码',
          //红色
//          errorText: '输入错误',
          //红色，现在在输入框的左下角，跟errorText位置一样(优先显示errorText)
//          helperText: 'password',
          //输入框内左侧widget，输入聚焦时，颜色跟primaryColor
          prefixIcon: Icon(Icons.lock),
          //输入框左侧的widget（可是text、icon……）
          icon: Text(
            '密码：',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          //输入框内右侧的widget
          suffixIcon: Icon(Icons.remove_red_eye),
          //聚焦时才显示颜色跟hintColor，显示在输入框的右边
          suffixText: '后缀',
          contentPadding: EdgeInsets.all(5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(21.11), //边框裁剪成11.11°角
            borderSide: BorderSide(
                color: Colors.black, width: 25.0), //没有效果，想要修改就返回Theme（如前面账号样式）
          )),
    );
  }

  //账号、密码输入框
  Widget textSection = new Container(
    padding: const EdgeInsets.all(32.0),
    child: new Column(
      //主轴Flex的值
      mainAxisSize: MainAxisSize.max,
      //MainAxisAlignment：主轴方向上的对齐方式，会对child的位置起作用
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        buildAccountTextFied(_accountController),
        buildPasswordTextFied(_passwordController),
      ],
    ),
  );

  //登录进行布局及“账号”、“密码”格式校验、弹窗的提示、路由（写在build里面太长了，抽出来）
  Widget loginButton = new Container(
      margin: const EdgeInsets.only(left: 35, right: 35),
      //这个widget距离父控件左右35（还有个all就是距离左上右下四个方向）
      child: new SizedBox(
          //用来设置宽高，如直接使用RaisedButton则不能设置
          height: 50,
          child: new RaisedButton(
              //一个凸起的材质矩形按钮
              color: Colors.red,
              child: new Text(
                '登录',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                //按下时的事件
                _checkAccount(); //校验账号格式，以此来更新_accountState
                _checkPassword(); //校验账号格式，以此来更新_passwordState
                if (_accountState) {
                  if (_passwordState) {
                    _checkHint =
                        '恭喜账号：' + _accountController.text.toString() + "登录成功";
                  } else {
                    _checkHint = '请输入8~15位密码！';
                  }
                } else {
                  _checkHint = '请输入不低于7位账号！';
                }
                showDialog(
                  context: context1,
                  barrierDismissible: true, //点击弹窗外部是否消失
                  child: new AlertDialog(
                    title: new Text(
                      //标题
                      '提示',
                      style:
                          new TextStyle(color: Colors.red[300], fontSize: 18),
                    ),
                    content: new Text(_checkHint), //提示语
                    actions: <Widget>[
                      new FlatButton(
                          //一个扁平的Material按钮
                          onPressed: () {
                            Navigator.of(context1).pop(); //弹窗消失
                          },
                          child: Text('取消')),
                      new FlatButton(
                          //对话框按钮
                          onPressed: () {
                            if (_accountState && _passwordState) {
                              //账号密码都符合条件
                              Navigator.pushNamed(context1,
                                  '/Home'); //使用的是“命名导航路由”，具体去哪个界面，看main.dart 对应routeName（'/Home'）的界面
                            } else {
                              Navigator.of(context1).pop(); //弹窗消失
                            }
                          },
                          child: Text('确定')),
                    ],
                  ),
                );
              })));

  Widget buttons(String name, String routeName) {
    return new Container(
      margin: EdgeInsets.only(left: 32, top: 32, right: 32),
      child: new SizedBox(
        height: 50,
        child: new RaisedButton(
            color: Colors.red,
            child: new Text(
              name,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            onPressed: () {
              Navigator.pushNamed(context1, routeName);
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    context1 = context;
    return Scaffold(
        appBar: new AppBar(
          title: new Text('登录'),
        ),
        body: new ListView(
          children: [
            new Image.asset(
              'images/lake.jpg',
              width: 600,
              height: 240,
              //cover(充满容器)、fill（充满父容器）、contain（总有宽或高跟父一样）、none(原图居中显示)、fitWidth（宽度跟父一样）、fitHeight（高度跟父一样）
              fit: BoxFit.contain,
            ),
            textSection,
            loginButton,
//            buttons("想去文章列表", '/articleList'),
//            buttons("想去Flutterdemo", '/flutter'),
            buttons("想去HeroAnimation", '/heroAnimation'),
          ],
        ));
  }
}
