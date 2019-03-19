import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final String title;
  final IconData homeIcon;
  final String screenName;
  final String navigateTo;
  final Function onTap;

  const DrawerTile({
    @required this.screenName,
    @required this.homeIcon,
    @required this.title,
    this.navigateTo,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Icon(
              homeIcon,
              color: Colors.grey[700],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      onTap: () {
        onTap();
        if (screenName == title)
          Navigator.pop(context);
        else if (navigateTo != null)
          Navigator.of(context).pushNamed("$navigateTo");
      },
    );
  }
}
