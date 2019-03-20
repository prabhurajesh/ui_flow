import 'package:flutter/material.dart';
import 'package:ui_flow/components/myCard.dart';
import 'package:ui_flow/services/api.dart';

class DashBoard extends StatefulWidget {
  final User user;
  const DashBoard({this.user});
  _DashBoard createState() => _DashBoard();
}

class _DashBoard extends State<DashBoard> {
  // String mobile = "";
  bool search = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Inventory  ",
          // style: TextStyle(fontSize: 30, color: Colors.white),
          //style: Theme.of(context).textTheme.display1,
        ),
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.more_vert, color: Colors.white, size: 30),
//            onPressed: () {},
//          )
//        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            MyCard(
              title: "Today's Revenue",
              content: Expanded(
                  child:
                      Container(child: Center(child: Text("Panel Content")))),
            ),
            MyCard(
              title: "Today's Forecast",
              content: Expanded(
                  child:
                      Container(child: Center(child: Text("Panel Content")))),
            ),
            MyCard(
              title: "Yesterday's Revenue",
              content: Expanded(
                  child:
                      Container(child: Center(child: Text("Panel Content")))),
            ),
            MyCard(
              title: "#Today's Customers",
              content: Expanded(
                  child:
                      Container(child: Center(child: Text("Panel Content")))),
            ),
            MyCard(
              title: "#Yesterday's Customers",
              content: Expanded(
                  child:
                      Container(child: Center(child: Text("Panel Content")))),
            ),
          ],
        ),
      ),
    );
  }
}
