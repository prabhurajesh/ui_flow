import 'package:flutter/material.dart';

String email = "";
String pwd = "";
String username = "";

class MyLoginPage extends StatefulWidget {
  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage>
    with SingleTickerProviderStateMixin {
  bool visible = true;
  bool shrink = false;

  Animation<double> animation;
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation = Tween<double>(begin: 280, end: 70).animate(controller)
      // #enddocregion print-state
      // #docregion print-state
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            shrink = true;
            nextPage();
          });
        }
      })
      ..addListener(() => setState(() {}));
    // controller.forward();
  }

  nextPage() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushNamed(context, '/home');
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Builder(
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                              image: AssetImage("assets/images/logo.jpg")))),
                  // child: ClipOval(
                  //   //child: Image(image: AssetImage("assets/images/logo.jpg")),
                  //   child: Image.asset("assets/images/logo.jpg"),
                  // ),
                  // CircleAvatar(
                  //   backgroundImage: AssetImage("assets/images/logo.jpg"),
                  // ),

                  SizedBox(
                    height: 40,
                  ),
                  Card(
                    shape: StadiumBorder(
                        //side: BorderSide(width: 0.0),
                        ),
                    elevation: 10,
                    // semanticContainer: true,
                    child: TextField(
                        style: TextStyle(fontSize: 20, color: Colors.black),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "UserName",
                          hasFloatingPlaceholder: true,
                          prefixIcon: Icon(Icons.person),
                        ),
                        onChanged: (str) {
                          username = str;
                        }),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    shape: StadiumBorder(
                        // side: BorderSide(width: 0.0),
                        ),
                    elevation: 10,
                    child: TextField(
                        obscureText: visible,
                        style: TextStyle(fontSize: 20, color: Colors.black),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password",
                            prefixIcon: Icon(Icons.lock),
                            suffix: InkWell(
                              child: Icon(
                                visible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                // size: 25,
                              ),
                              onTap: () {
                                setState(() {
                                  visible = !visible;
                                });
                              },
                            )),
                        onChanged: (str) {
                          pwd = str;
                        }),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Card(
                    shape: StadiumBorder(
                        // side: BorderSide(width: 0.0),
                        ),
                    elevation: 10,
                    child: InkWell(
                      child: Container(
                        width: animation.value,
                        height: 50.0,
                        alignment: FractionalOffset.center,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(247, 64, 106, 1.0),
                          borderRadius:
                              BorderRadius.all(const Radius.circular(30.0)),
                        ),
                        child: shrink
                            ? Theme(
                                data: ThemeData(accentColor: Colors.white),
                                child: CircularProgressIndicator())
                            : Text(
                                " LOGIN",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 0.3,
                                ),
                              ),
                      ),
                      onTap: () {
                        validate(context);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Card(
                    shape: StadiumBorder(
                        // side: BorderSide(width: 0.0),
                        ),
                    elevation: 10,
                    child: InkWell(
                      child: Container(
                        width: 280,
                        height: 50.0,
                        alignment: FractionalOffset.center,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(247, 64, 106, 1.0),
                          borderRadius:
                              BorderRadius.all(const Radius.circular(30.0)),
                        ),
                        child: Text(
                          " Forgot Password",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ),
                      onTap: () {
                        validate(context);
                      },
                    ),
                  ),
                ]),
          );
        },
      ),
    );
  }

  void validate(BuildContext context) {
    if (username.isEmpty) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("please fill username"),
      ));
    } else {
      if (pwd.isEmpty) {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("please fill password"),
        ));
      } else {
        controller.forward();
        // Navigator.push(context,
        //  MaterialPageRoute(builder: (BuildContext context) => Homepage()));

      }
    }
  }
}
