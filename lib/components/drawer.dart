import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_flow/components/drawerTitle.dart';
import 'package:ui_flow/services/api.dart';

class AppDrawer extends StatelessWidget {
  final String screenName;
  final User user;
  String pwd = "";
  String username = "";

  AppDrawer(this.screenName, {this.user});
  @override
  Widget build(BuildContext context) {
    // List<User> users = await api.loginUser(username.trim(), pwd.trim());
    var width = MediaQuery.of(context).size.width;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                  user.name,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                ),
                Text(
                  user.number,
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
            onTap: () {
              // SharedPreferences sharedPreferences =
              //     await SharedPreferences.getInstance();
              // await sharedPreferences.setString("username", username);
              // await sharedPreferences.setString("password", pwd);
              // Navigator.pushReplacement(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => DropDownScreen(user: users[0])));
            },
          ),
          DrawerTile(
            screenName: screenName,
            title: "Logout",
            homeIcon: Icons.people,
            navigateTo: "/login",
            onTap: () async {
              await (await SharedPreferences.getInstance()).clear();
            },
          ),
        ],
      ),
    );
  }
}
