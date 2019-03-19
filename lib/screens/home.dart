import 'package:flutter/material.dart';
import 'package:ui_flow/components/drawer.dart';
import 'package:ui_flow/components/myCard.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  // String mobile = "";
  bool search = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: AppDrawer("Dashboard"),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
                icon: new Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
        ),
        automaticallyImplyLeading: false,
        title: Text(
          "Inventory  ",
          // style: TextStyle(fontSize: 30, color: Colors.white),
          //style: Theme.of(context).textTheme.display1,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.white, size: 30),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            MyCard(
              title: "Today's Revenue",
              content: "Panel Content",
            ),
            MyCard(
              title: "Today's Forecast",
              content: "Panel Content",
            ),
            MyCard(
              title: "Yesterday's Revenue",
              content: "Panel Content",
            ),
            MyCard(
              title: "#Today's Customers",
              content: "Panel Content",
            ),
            MyCard(
              title: "#Yesterday's Customers",
              content: "Panel Content",
            ),
          ],
        ),
      ),
    );
  }
}
