import 'dart:convert';

import 'package:flutter/services.dart';

class Api{
  Future<List<User>> loginUser(String id,String password) async{
    await Future.delayed(Duration(
      seconds: 2,
    ));
    Map data = json.decode(await rootBundle.loadString("assets/data.json"));
    return
      List<User>.of(
        List<User>.generate((data["users"].length), (index)=>User.fromJson(data["users"][index]))
       .where((user)=> user.password.trim() == password.trim() && user.id.trim() == id.trim()
    ));
  }
}

class User {
  final String id;
  final List<String> stores;
  final String password;
  final String name;
  final String number;
  final List<Merchant> merchants;
  User({this.id, this.stores, this.merchants,this.password,this.name,this.number});
  factory User.fromJson(Map map){
    List<String> stores = new List<String>.generate(map["stores"].length, (index)=>map["stores"][index].toString());
    List<Merchant> merchants = new List<Merchant>.generate(map["merchants"].length,
            (index)=>Merchant.fromJson(map["merchants"][index]));
    return new User(
      id: map['userid'],
      stores: stores,
      merchants: merchants,
      password: map['password'] as String,
      name:map['name'],
      number: map['number']
    );
  }
}

class Merchant {
  final String id;
  final String name;
  final String location;

  Merchant({this.id, this.name, this.location});
  factory Merchant.fromJson(Map map){
    return Merchant(
      id: map['id'] as String ?? "",
      name: map['name'] as String ?? "",
      location: map['location'] as String ?? "",
    );
  }
}
Api api = new Api();