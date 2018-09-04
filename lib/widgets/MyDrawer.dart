import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget{
  // 菜单文本前面的图标大小
  static const double IMAGE_ICON_WIDTH = 30.0;
  // 菜单后面的箭头的图标大小
  static const double ARROW_ICON_WIDTH = 16.0;
  // 菜单后面的箭头图片
  var rightArrowIcon = new Image.asset(
    'images/ic_arrow_right.png',
    width: ARROW_ICON_WIDTH,
    height: ARROW_ICON_WIDTH,
  );
  // 菜单的文本
  List menuTitles = ['发布动弹', '动弹小黑屋', '关于', '设置'];
  // 菜单文本前面的图标
  List menuIcons = [
    './images/leftmenu/ic_fabu.png',
    './images/leftmenu/ic_xiaoheiwu.png',
    './images/leftmenu/ic_about.png',
    './images/leftmenu/ic_settings.png'
  ];
  // 菜单文本的样式
  TextStyle menuStyle = new TextStyle(
    fontSize: 15.0,
  );

  Image getIconImage(path){
    return Image.asset(path,width: 25.0,height: 25.0);
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(width: 304.0),
      child: Material(
        elevation: 16.0,
        child: Container(
          decoration: BoxDecoration(color: Color(0xFFFFFFFF)),
          child: ListView.builder(
            itemCount: menuTitles.length * 2 + 1,
              itemBuilder: renderRow
          ),
        ),
      ),
    );
  }

  Widget renderRow(BuildContext context,int index){
    //头部封面
    if(index == 0){
      var image = Image.asset(
        "images/cover_img.jpg",
        width: 304.0,
        height: 304.0,
      );
      return Container(
        width: 304.0,
        height: 304.0,
        margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
        child: image,
      );
    }
    // 舍去之前的封面图
    index -= 1;
    if(index.isOdd) return Divider();
    // 偶数，就除2取整，然后渲染菜单item
    index = index ~/ 2;
    // 菜单item组件
    var listItemContent = Padding(
      // 设置item的外边距
      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      // Row组件构成item的一行
      child: Row(
          children: <Widget>[
            getIconImage(menuIcons[index]),
            Expanded(
              child: Text(
                menuTitles[index],
                style: menuStyle,
              ),
            ),
            rightArrowIcon
          ],
      ),
    );

    return InkWell(
      child: listItemContent,
      onTap: (){
        print("click list item $index");
      },
    );
  }

}