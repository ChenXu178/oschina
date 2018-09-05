import 'package:flutter/material.dart';

class SlideView extends StatefulWidget{
  var data;
  // data表示轮播图中的数据
  SlideView(data) {
    this.data = data;
  }

  @override
  State<StatefulWidget> createState() {
    // 可以在构造方法中传参供SlideViewState使用
    // 或者也可以不传参数，直接在SlideViewState中通过this.widget.data访问SlideView中的data变量
    return SlideViewState(data);
  }

}

class SlideViewState extends State<SlideView> with SingleTickerProviderStateMixin{
  // TabController为TabBarView组件的控制器
  TabController tabController;
  List slideData;

  SlideViewState(data) {
    slideData = data;
  }

  @override
  void initState() {
    // 初始化控制器
    tabController = TabController(length: slideData.length == 0 ? 0 : slideData.length, vsync: this);
    super.initState();
  }

  // 销毁
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    if(slideData != null && slideData.length > 0){
      for(int i = 0;i < slideData.length; i++){
        var item = slideData[i];
        // 图片URL
        var imgUrl = item['imgUrl'];
        // 资讯标题
        var title = item['title'];
        // 资讯详情URL
        var detailUrl = item['detailUrl'];
        items.add(GestureDetector(
          onTap: (){
            //跳转到图片详情
          },
          child: Stack(// Stack组件用于将资讯标题文本放置到图片上面
            children: <Widget>[
              // 加载网络图片
              Image.network(imgUrl),
              Container(
                // 标题容器宽度跟屏幕宽度一致
                width: MediaQuery.of(context).size.width,
                // 背景为黑色，加入透明度
                color: Color(0x50000000),
                // 标题文本加入内边距
                child: Padding(
                  padding: EdgeInsets.all(6.0),
                  // 字体大小为15，颜色为白色
                  child: Text(title,style: TextStyle(color:Colors.white,fontSize: 14.0)),
                ),
              )
            ],
          ),
        ));
      }
    }
    return TabBarView(
      controller: tabController,
      children: items,
    );
  }

}