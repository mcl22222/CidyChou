import 'package:flutter/material.dart';
import 'package:flutter_app/bean/Article.dart';
import 'package:flutter_app/screen/ContentScreen.dart';

class ArticleListScreen extends StatelessWidget {
  final List<Article> articles = new List.generate(
    10,
    (i) => new Article(
      title: 'Article $i',
      content: 'Article $i:The quick brown fox jumps over the lazy dog.',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Article List'),
      ),
      body: new ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return new ListTile(
            title: new Text(articles[index].title),
            onTap: () async {
              String result = await Navigator.push(
                  //result接收返回的数据
                  context,
                  new PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 1000),
                    pageBuilder: (context, _, __) =>
                        new ContentScreen(articles[index]),
                    transitionsBuilder:
                        (_, Animation<double> animation, __, Widget child) =>
                            new FadeTransition(
                      opacity: animation,
                      child: new RotationTransition(
                        turns: new Tween<double>(begin: 0.0, end: 1.0)
                            .animate(animation),
                        child: child,
                      ),
                    ),
                  ));
              if (result != null) {
                Scaffold.of(context).showSnackBar(
                  new SnackBar(
                    content: new Text('$result'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
