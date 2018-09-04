import 'package:flutter/material.dart';

class NewsDetailPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("资讯详情", style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("News Detail Page."),
            RaisedButton(
              child: Text("Back"),
              onPressed: (){
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }

}