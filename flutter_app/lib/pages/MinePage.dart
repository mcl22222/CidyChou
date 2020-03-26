import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/RefreshPage.dart';

import 'ExpansionTilePage.dart';
import 'FutureBuilderPage.dart';
import 'SharedPreferencesPage.dart';

//我的包含顶部导航栏
class MinePage extends StatefulWidget {
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  // 初始化方法
  @override
  void initState() {
    super.initState();
//    tabController = TabController(length: choices.length, vsync: this);
    tabController = TabController(length: 4, vsync: this);
  }

  // 销毁方法
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        //标题居中
        centerTitle: true,
        //标题栏背景色
        backgroundColor: Colors.blue,
        //设置没有返回按钮
        automaticallyImplyLeading: false,
        title: TabBar(
          //选中的颜色
          labelColor: Colors.white,
          //选中的样式
          labelStyle: TextStyle(fontSize: 15),
          //未选中的颜色
          unselectedLabelColor: Colors.black,
          //未选中的样式
          unselectedLabelStyle: TextStyle(fontSize: 12),
          //是否可以滚动
          isScrollable: true,
          //指示器颜色
          indicatorColor: Colors.white,
          //指示器高度
          indicatorWeight: 1,
          //底部指示器的padding
          indicatorPadding: EdgeInsets.zero,
          //指示器大小计算方式，TabBarIndicatorSize.label跟文字等宽,TabBarIndicatorSize.tab跟每个tab等宽
          indicatorSize: TabBarIndicatorSize.tab,
          //每个label的padding值
          labelPadding: EdgeInsets.all(10),
          //内容
          tabs: <Widget>[
            Tab(icon: Icon(Icons.flag),text:'FutureBuilder'),
            Tab(icon: Icon(Icons.share),text:'shared_preferences'),
            Tab(icon: Icon(Icons.filter_vintage),text:'ExpansionTile'),
            Tab(icon: Icon(Icons.layers),text:'Refresh'),
          ],
//          tabs: choices.map((Choice choice) {
//            return Tab(
//              text: choice.title,
//              icon: Icon(choice.icon),
//            );
//          }).toList(),
          controller: tabController,
        ),
      ),
      body: Container(
        child: TabBarView(
          children: <Widget>[
            FutureBuilderPage(),
            SharedPreferencesPage(),
            ExpansionTilePage(),
            RefreshPage(),
          ],
          controller: tabController,
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'FutureBuilder', icon: Icons.flag),
  const Choice(title: 'shared_preferences', icon: Icons.share),
  const Choice(title: 'ExpansionTile', icon: Icons.filter_vintage),
  const Choice(title: 'Refresh', icon: Icons.layers),
];
