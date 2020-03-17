import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/animation/PhotoHero.dart';

class HeroAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const timeDilation = 5.0;
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Basic Hero Animation'),
      ),
      body: new Center(
        child: new PhotoHero(
          photo: 'images/lake.jpg',
          width: 300.0,
          onTap: () {
            Navigator.of(context).push(
                new MaterialPageRoute<Null>(builder: (BuildContext context) {//创建目标路由
              return new Scaffold(
                appBar: new AppBar(
                  title: const Text('Flippers Page'),
                ),
                body: new Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.topLeft,
                  child: new PhotoHero(
                    photo: 'images/lake.jpg',
                    width: 100,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              );
            }));
          },
        ),
      ),
    );
  }
}
