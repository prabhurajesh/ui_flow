import 'package:flutter/material.dart';
import 'package:ui_flow/components/drawerTitle.dart';

class AppDrawer extends StatelessWidget {
  final String screenName;

  AppDrawer(this.screenName);
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 5),
                ),
                Container(
                  width: 80,
                  height: 80,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/logo.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                ),
                Text(
                  "Rajesh Cool Dude",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                ),
                Text(
                  "+91 8897536459",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )
              ],
            ),
            decoration: BoxDecoration(
              color: Color.fromRGBO(80, 126, 245, 1),
            ),
          ),
          DrawerTile(
            screenName: screenName,
            title: "Inventory",
            homeIcon: Icons.offline_bolt,
            navigateTo: "/home",
            onTap: () {},
          ),
          DrawerTile(
            screenName: screenName,
            title: "Crm",
            homeIcon: Icons.people,
            navigateTo: "/home",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
