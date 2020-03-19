import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//我的包含顶部导航栏
class MinePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: choices.length,
        child: Scaffold(
          appBar: AppBar(
//            //用title原先的标题栏没有，用bottom则在原先下面建立一个bar
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
//              indicatorWeight: 1,
              //底部指示器的padding
              indicatorPadding: EdgeInsets.zero,
              //指示器大小计算方式，TabBarIndicatorSize.label跟文字等宽,TabBarIndicatorSize.tab跟每个tab等宽
              indicatorSize: TabBarIndicatorSize.tab,
              //每个label的padding值
              labelPadding: EdgeInsets.all(25),
              //内容
              tabs: choices.map((Choice choice) {
                return Tab(
                  text: choice.title,
                  icon: Icon(choice.icon),
                );
              }).toList(),
            ),
          ),
          body:


          TabBarView(
            children: choices.map((Choice choice) {
              return Padding(
                padding: const EdgeInsets.all(30.0),
                child: ChoiceCard(choice: choice),
              );
            }).toList(),

          ),
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
  const Choice(title: '性别', icon: Icons.pregnant_woman),
  const Choice(title: '姓名', icon: Icons.local_florist),
  const Choice(title: '年龄', icon: Icons.filter_vintage),
  const Choice(title: '学历', icon: Icons.layers),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 128, color: textStyle.color),
            Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MinePage());
}
