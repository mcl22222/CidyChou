import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//可展开的二级列表
class ExpansionTilePage extends StatefulWidget {
  _ExpansionTilePageState createState() => _ExpansionTilePageState();
}

class _ExpansionTilePageState extends State<ExpansionTilePage> {
  var CITY_NAME = {
    '贺州': ['1', '2', '3'],
    '桂林': ['1', '2', '3'],
    '梧州': ['1', '2', '3'],
    '广州': ['1', '2', '3'],
  };

  List<Widget> _buildList() {
    List<Widget> widgets = [];
    //将数据装到widget中
    CITY_NAME.keys.forEach((key) {
      widgets.add(_item(key, CITY_NAME[key]));
    });
    return widgets;
  }

  //一级的布局，及关联二级
  Widget _item(String city, List<String> subCities) {
    return ExpansionTile(
      title: Text(
        city,
        style: TextStyle(color: Colors.black, fontSize: 20),
      ),
      children: subCities.map((subCities) => _buildSub(subCities)).toList(),
    );
  }

  //二级的布局
  Widget _buildSub(String subCities) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
//        color: Colors.lightBlueAccent,
        height: 50,
        margin: EdgeInsets.only(bottom: 5),
        alignment: Alignment.centerLeft,
        //装饰
        decoration: BoxDecoration(color: Colors.lightBlueAccent),
        child: Text(
          subCities,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: _buildList(),
        ),
      ),
    );
  }
}
