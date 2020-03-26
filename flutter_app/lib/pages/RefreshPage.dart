import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//上下拉刷新（不满屏时没有操作）
class RefreshPage extends StatefulWidget {
  _RefreshPageState createState() => _RefreshPageState();
}

class _RefreshPageState extends State<RefreshPage> {
  List<String> chainList = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
  ];
  ScrollController _scrollController = ScrollController();

  void initState() {
    //把滚动控制器加入到监听里面，滚动到大后就加载更多
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadData();
      }
    });
    super.initState();
  }

  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  //上拉加载更多，延时2秒后
  _loadData() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      List<String> list =
          List<String>.from(chainList); //此时，list里面复制了一份chainList
      list.addAll(chainList); //list再加一份chainList（此时list有两份chainList）
      chainList = list; //更改chainList（总是比原先多一份）
    });
  }

  //下拉刷新时，延时2秒后执行
  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    //把有修改的视图重新绘制一遍，这里chainList变了
    setState(() {
      //把chainList变成新的chainList（元素倒置第一个与最后一个对换，以此类推）
      chainList = chainList.reversed.toList();
    });
    return null;
  }

  //数据源循环每个元素
  List<Widget> getList() {
    return chainList.map((item) => getListWidget(item)).toList();
  }

  //每个子widget的样式
  static Widget getListWidget(String str) {
    return Container(
      height: 50,
      width: 30,
      color: Colors.lightBlueAccent,
      alignment: Alignment.center,
      margin: EdgeInsets.all(10),
      child: Text(
        str,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        //下拉刷新
        onRefresh: _handleRefresh,
        child: ListView(
          //滚动的方向，可水平、垂直
          scrollDirection: Axis.vertical,
          //是否倒序显示内容（默认false，改成true时，会从底部开始布局的）
          reverse: false,
          //距离
          padding: EdgeInsets.all(15),
          //滑动监听，用于上拉加载更多，监听滑动的距离来执行相应的操作
          controller: _scrollController,
          //下拉刷新
          children: getList(),
        ),
      ),
    );
  }
}
