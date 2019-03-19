import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String title;
  final String content;

  MyCard({
    @required this.title,
    @required this.content,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.20,
      child: Card(
          margin: EdgeInsets.all(15),
          borderOnForeground: true,
          elevation: 10,
          //shape: StadiumBorder(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Column(children: <Widget>[
            Container(
              height: height * 0.06,
              width: width,
              decoration: BoxDecoration(
                  color: Colors.grey[700],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: Center(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Container(
              height: height * 0.09,
              width: width,
              child: Center(
                child: Text(
                  content,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w700),
                ),
              ),
            )
          ])),
    );
  }
}
