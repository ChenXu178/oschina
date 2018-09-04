import 'package:flutter/material.dart';
import 'package:oschina/widgets/SlideView.dart';

// 资讯列表页面
class NewsListPage extends StatelessWidget{

  // 轮播图的数据
  var slideData = [];
  // 列表的数据（轮播图数据和列表数据分开，但是实际上轮播图和列表中的item同属于ListView的item）
  var listData = [];
  // 列表中资讯标题的样式
  TextStyle titleTextStyle = new TextStyle(fontSize: 15.0);
  // 时间文本的样式
  TextStyle subtitleStyle = new TextStyle(color: const Color(0xFFB5BDC0), fontSize: 12.0);

  NewsListPage() {
    // 这里做数据初始化，加入一些测试数据
    for (int i = 0; i < 3; i++) {
      Map map = new Map();
      // 轮播图的资讯标题
      map['title'] = 'Python 之父透露退位隐情，与核心开发团队产生隔阂';
      // 轮播图的详情URL
      map['detailUrl'] = 'https://www.oschina.net/news/98455/guido-van-rossum-resigns';
      // 轮播图的图片URL
      map['imgUrl'] = 'https://static.oschina.net/uploads/img/201807/30113144_1SRR.png';
      slideData.add(map);
    }
    for (int i = 0; i < 30; i++) {
      Map map = new Map();
      // 列表item的标题
      map['title'] = 'J2Cache 2.3.23 发布，支持 memcached 二级缓存';
      // 列表item的作者头像URL
      map['authorImg'] = 'https://static.oschina.net/uploads/user/0/12_50.jpg?t=1421200584000';
      // 列表item的时间文本
      map['timeStr'] = '2018/7/30';
      // 列表item的资讯图片
      map['thumb'] = 'https://static.oschina.net/uploads/logo/j2cache_N3NcX.png';
      // 列表item的评论数
      map['commCount'] = 5;
      listData.add(map);
    }
  }

  @override
  Widget build(BuildContext context) {
    // 这里itemCount是将轮播图组件、分割线和列表items都作为ListView的item算了
    return ListView.builder(
      itemCount: listData.length * 2 + 1,
      itemBuilder: (context,i) => renderRow(i),
    );
  }

  //渲染列表
  Widget renderRow(i){
    // i为0时渲染轮播图
    if(i == 0){
      return Container(
        height: 180.0,
        child: SlideView(slideData),
      );
    }
    // i > 0时
    i -= 1;
    // i为奇数，渲染分割线
    if(i.isOdd)return Divider(height: 1.0);
    // 将i取整
    i = i ~/ 2;
  }

}