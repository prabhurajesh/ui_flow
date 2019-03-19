import 'package:flutter/material.dart';
import 'package:ui_flow/components/drawer.dart';
import 'package:ui_flow/screens/home.dart';
import 'package:ui_flow/services/api.dart';

class DropDownScreen extends StatefulWidget{
  final User user;
  const DropDownScreen({this.user});
  _DropDownState createState() => _DropDownState();
}
class _DropDownState extends State<DropDownScreen>{
  String value;
  Merchant merchant;
  @override
  void initState() {
    // TODO: implement initState
    value = widget.user.stores.length>0?widget.user.stores[0]:null;
    merchant = widget.user.merchants[0];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Home"),
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (context) => IconButton(
            icon: new Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: AppDrawer("Dropdown",user:widget.user),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 200,
                  child: Text(
                    "Store ID",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                ),
                Expanded(
                  child: DropdownButton(
                    isExpanded: true,
                    iconSize: 35,
                    disabledHint: Text("No Stores",textAlign: TextAlign.center,),
                    items: List<DropdownMenuItem<String>>.generate(widget.user.stores.length,
                            (index)=>DropdownMenuItem(
                              child: Text(widget.user.stores[index]),
                              value: widget.user.stores[index],
                            )),
                    value: value,
                    onChanged: widget.user.stores.length>1?(val){
                      setState(() {
                        value = val;
                      });
                    }:null,
                  ),
                ),
              ],
            ),
            SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 200,
                child: Text(
                  "Merchant ID",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ),
            Expanded(
              child: DropdownButton(
                isExpanded: true,
                iconSize: 35,
                disabledHint: Text("No Merchants",textAlign: TextAlign.center,),
                items: List<DropdownMenuItem<Merchant>>.generate(widget.user.merchants.length,
                        (index)=>DropdownMenuItem(
                      child: Text(widget.user.merchants[index].id),
                      value: widget.user.merchants[index],
                    )),
                value: merchant,//merchant.id,
                onChanged: widget.user.merchants.length>0?(val){
                  print(val);
                  setState(() {
                    merchant = val;
                  });
                }:null,
              ),
            ),
          ],
          ),
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 200,
                  child: Text(
                    "Name",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    merchant.name,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w500
                    ),
                  )
                ),
              ],
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 200,
                  child: Text(
                    "Location",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ),
                Expanded(
                    child: Text(
                      merchant.location,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w500
                      ),
                    )
                ),
              ],
            ),
            SizedBox(height: 60,),
            Card(
              shape: StadiumBorder(
                // side: BorderSide(width: 0.0),
              ),
              elevation: 10,
              child: InkWell(
                child: Container(
                  width: 280,
                  height: 45.0,
                  alignment: FractionalOffset.center,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius:
                    BorderRadius.all(const Radius.circular(30.0)),
                  ),
                  child: Text(
                    "DashBoard",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context)=>HomeScreen()
                  ));
                },
              ),
            ),
        ]
      ),
    )
    );
  }
}