import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeScreen extends StatelessWidget {
  //自定义字体
  final textStyle = const TextStyle(
    fontFamily: 'Chu',
    color: Colors.red,
    fontSize: 20,
  );

  //用于路由（就是界面的跳转），当跳转的事件没有写在build里面时用到（我这里抽到了loginButton里面）
  static BuildContext context1;

  //本地图片，也可以使用网络图片
  static List imageList = [
    'images/lake.jpg',
    'images/lake.jpg',
    'images/lake.jpg'
  ];

  static List chainList = ['武汉', '加油！', '中国', '加油！', '我们', '必胜！'];

  //轮播图控件，写在build的前面，Container创建矩形视觉元素，可对元素进行修饰eg:背景色、边框、边距、填充等
  static Widget swiperSection = new Container(
    //轮播图的高度
    height: 120,
    //轮播图，还有其它的属性，这里不一一介绍了
    child: Swiper(
      //有多少个
      itemCount: imageList.length,
      //是否自动滚动
      autoplay: true,
      //滚动的放心，左右、上下（默认左右）
      scrollDirection: Axis.horizontal,
      //用户滑动轮播图时是否停止自动播放
      autoplayDisableOnInteraction: true,
      itemBuilder: (BuildContext context, int index) {
        return Image.asset(
          //显示imageList里面的图片、imageList是网络图片时用Image.network
          imageList[index],
          fit: BoxFit.fill, //填充方式
        );
      },
      //轮播改变时调用的（用户操作或者自动轮播）
      onIndexChanged: (index) {
        //相应的操作，一般也不操作
      },
      //点击某个轮播图
      onTap: (index) {
        showDialog(
          context: context1,
          barrierDismissible: true, //点击弹窗外部是否消失
          child: getDialog("您点击了第:$index个轮播图"), //dialog显示点击的内容
        );
      },
      //显示指示器，SwiperPagination（）是默认，可以在里面修改位置、距离、样式
      pagination: SwiperPagination(
        alignment: Alignment.bottomCenter, //指示器的位置
        margin: const EdgeInsets.only(bottom: 10), //瑜边框的距离
        builder: SwiperPagination.dots, //指示器的样式：dots点、fraction数字
      ),
    ),
  );

  //GridView控件
  static Widget gridSection = new Container(
    child: GridView.count(
      //水平之间的间距
      crossAxisSpacing: 10.0,
      //垂直之间的间距
      mainAxisSpacing: 30.0,
      //GridView内边距，all四个方向
      padding: EdgeInsets.all(10.0),
      //一行显示多少个Widget
      crossAxisCount: 2,
      //Widget宽高比例
      childAspectRatio: 2.0,
      //数据
      children: getGridList(),
    ),
  );

  //获取GridView显示的数据，及设置子item的样式
  static List<Widget> getGridList() {
    return chainList.map((item) => getItemContainer(item)).toList();
  }

  //每个GridView里面的item设置
  static Widget getItemContainer(String item) {
    return new GestureDetector(
      //点击事件  onTap轻按
      onTap: () {
        showDialog(
          context: context1,
          barrierDismissible: true, //点击弹窗外部是否消失
          child: getDialog(item), //dialog显示点击的内容
        );
      },
      child: new Container(
        height: 80,
        margin: EdgeInsets.only(bottom: 5),
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Colors.red),
        child: Text(
          item,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }

  //显示点击事件
  static Widget getDialog(String item) {
    return new AlertDialog(
      title: new Text(
        //标题
        '提示',
        style: new TextStyle(color: Colors.red[300], fontSize: 18),
      ),
      content: new Text(item), //提示语
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
              Navigator.of(context1).pop(); //弹窗消失
            },
            child: Text('确定')),
      ],
    );
  }

  Widget build(BuildContext context) {
    context1 = context;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          '首页',
          style: textStyle,
        ),
      ),
      body: Center(
        //垂直方向上进行排列子widget
        child: Column(
          children: <Widget>[
            //Expanded会强制子组件填充可用空间，默认是等分，那么在里面设置大小没有效果，
            // 可用用Flexible不会强制填充，子组件自己大小是多少就多少（效果自己动手看看）
            new Expanded(child: swiperSection),
            new Expanded(flex: 2, child: gridSection),//flex默认是1，等分，设置2那么它占空间的2/3
          ],
        ),
      ),
    );
  }
}
