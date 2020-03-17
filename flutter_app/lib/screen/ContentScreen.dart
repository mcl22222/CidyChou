import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bean/Article.dart';

//文章列表的内容界面
class ContentScreen extends StatelessWidget {
  final Article article;

  ContentScreen(this.article);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('${article.title}'),
      ),
      body: new Padding(
        padding: new EdgeInsets.all(15.0),
        child: new Column(
          children: <Widget>[
            new Text('${article.content}'),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new RaisedButton(
                  onPressed: () {
                    Navigator.pop(context, 'Like');
                  },
                  child: new Text('Like'),
                ),
                new RaisedButton(
                  onPressed: () {
                    Navigator.pop(context, 'Unlike');
                  },
                  child: new Text('Unlike'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
