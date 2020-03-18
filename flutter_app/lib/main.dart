import 'package:flutter/material.dart';
import 'package:flutter_app/animation/HeroAnimation.dart';
import 'package:flutter_app/navigatior/MainNavigator.dart';
import 'package:flutter_app/screen/ArticleListScreen.dart';
import 'package:flutter_app/screen/FlutterDemo.dart';
import 'package:flutter_app/screen/LoginScreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      localizationsDelegates: {
        GlobalMaterialLocalizations.delegate,//为Material Components库提供了本地化的字符串和其他值
        GlobalWidgetsLocalizations.delegate,//定义widget默认的文本方向，从左到右或从右到左
      },
      supportedLocales: {
        const Locale('en','US'),
        const Locale('he','IL'),//Hebrew
      },
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        /**
         * 命名导航路由，启动程序默认打开的是以'/'对应的界面LoginScreen()
         * 凡是后面使用Navigator.of(context).pushNamed('/Home')，都会跳转到Home()，
         */
        '/': (BuildContext context) => new LoginScreen(),
        '/Home': (BuildContext context) => new MainNavigator(),
        '/articleList': (BuildContext context) => new ArticleListScreen(),
        '/flutter': (BuildContext context) => new FlutterScreen(),
        '/heroAnimation': (BuildContext context) => new HeroAnimation(),
      },
    );
  }
}
