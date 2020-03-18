import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/DancePage.dart';
import 'package:flutter_app/pages/HomePage.dart';
import 'package:flutter_app/pages/MinePage.dart';

//底部导航栏
class MainNavigator extends StatefulWidget {
  @override
  _MainNavigatorState createState() => new _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  final _defaultColor = Colors.grey;//没有选中时icon、文字的颜色
  final _activeColor = Colors.red;//选中的icon、文字的颜色
  int _currentIndex = 0;//默认显示第一个

  final List<Widget> _children = [
    new HomePage(),
    new DancePage(),
    new MinePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: new BottomNavigationBar(
        onTap: onTabTapped, //点击切换
        currentIndex: _currentIndex,//当前显示的界面下标
        type: BottomNavigationBarType.fixed, //文字的显示，shifting选中时显示，fixed不选中也显示
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: _defaultColor), //未选中的icon颜色
            activeIcon: Icon(Icons.home, color: _activeColor), //选中时的icon颜色
            title: new Text(
              '首页',
              style: TextStyle(
                  color: _currentIndex != 0
                      ? _defaultColor
                      : _activeColor //不为o表示未选中
                  ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_run, color: _defaultColor),
            activeIcon: Icon(Icons.directions_run, color: _activeColor),
            title: Text(
              '舞蹈',
              style: TextStyle(
                  color: _currentIndex != 1
                      ? _defaultColor
                      : _activeColor //不为1表示未选中
                  ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: _defaultColor),
            activeIcon: Icon(Icons.person, color: _activeColor),
            title: Text(
              '我的',
              style: TextStyle(
                  color: _currentIndex != 2
                      ? _defaultColor
                      : _activeColor //不为2表示未选中
                  ),
            ),
          ),
        ],
      ),
    );
  }

  //点击切换时，更新当前选中的界面下标
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
