// main.dart文件内容
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'widgets/MyDrawer.dart';
import 'pages/NewsListPage.dart';
import 'pages/TweetsListPage.dart';
import 'pages/DiscoveryPage.dart';
import 'pages/MyInfoPage.dart';

void main() => runApp(new MyOSCClient());

// MyApp是一个有状态的组件，因为页面标题，页面内容和页面底部Tab都会改变
class MyOSCClient extends StatefulWidget{
  @override
  createState() => MyOSCClientState();

}

class MyOSCClientState extends State<MyOSCClient>{
  final tabTextStyleNormal = new TextStyle(color: const Color(0xff969696));
  final tabTextStyleSelected = new TextStyle(color: const Color(0xff63ca6c));
  // 页面当前选中的Tab的索引
  int _tabIndex = 0;
  // 页面底部TabItem上的图标数组
  var tabImages;
  var _body;

  // 页面顶部的大标题（也是TabItem上的文本）
  var appBarTitles = ['资讯', '动弹', '发现', '我的'];

  // 数据初始化，包括TabIcon数据和页面内容数据
  void initData() {
    if (tabImages == null) {
      tabImages = [
        [
          getTabImage('images/ic_nav_news_normal.png'),
          getTabImage('images/ic_nav_news_actived.png')
        ],
        [
          getTabImage('images/ic_nav_tweet_normal.png'),
          getTabImage('images/ic_nav_tweet_actived.png')
        ],
        [
          getTabImage('images/ic_nav_discover_normal.png'),
          getTabImage('images/ic_nav_discover_actived.png')
        ],
        [
          getTabImage('images/ic_nav_my_normal.png'),
          getTabImage('images/ic_nav_my_pressed.png')
        ]
      ];
    }
    // 页面body部分组件
    _body = new IndexedStack(
      children: <Widget>[
        new NewsListPage(),
        new TweetsListPage(),
        new DiscoveryPage(),
        new MyInfoPage()
      ],
      index: _tabIndex,
    );
  }

  // 传入图片路径，返回一个Image组件
  Image getTabImage(path) {
    return new Image.asset(path, width: 20.0, height: 20.0);
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return MaterialApp(
      theme: ThemeData(
        // 设置页面的主题色
        primaryColor: const Color(0xFF63CA6C)
      ),
      home: Scaffold(
        appBar: AppBar(
          // 设置AppBar标题
          title: Text(
            appBarTitles[_tabIndex],
            // 设置AppBar上文本的样式
            style: TextStyle(color: Colors.white),
          ),
          // 设置AppBar上图标的样式
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: _body,
        // bottomNavigationBar属性为页面底部添加导航的Tab，CupertinoTabBar是Flutter提供的一个iOS风格的底部导航栏组件
        bottomNavigationBar: CupertinoTabBar(
          items: getBottomNavItems(),
          currentIndex: _tabIndex,
          onTap: (index){
            // 底部TabItem的点击事件处理，点击时改变当前选择的Tab的索引值，则页面会自动刷新
            setState(() {
              _tabIndex = index;
            });
          },
        ),
        drawer: MyDrawer(),
      ),
    );
  }

  List<BottomNavigationBarItem> getBottomNavItems(){
    List<BottomNavigationBarItem> list = List();
    for(int i = 0; i < 4; i++){
      list.add(BottomNavigationBarItem(
        icon: getTabIcon(i),
        title: getTabTitle(i)
      ));
    }
    return list;
  }

  // 根据索引值确定TabItem的icon是选中还是非选中
  Image getTabIcon(int curIndex){
    if(curIndex == _tabIndex){
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  Text getTabTitle(int curIndex){
    return Text(
      appBarTitles[curIndex],
      style: getTabTextStyle(curIndex)
    );
  }


  TextStyle getTabTextStyle(int curIndex){
    if (curIndex == _tabIndex) {
      return tabTextStyleSelected;
    }
    return tabTextStyleNormal;
  }


}