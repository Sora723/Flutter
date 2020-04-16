import 'package:flutter/material.dart';
//import 'loginpage.dart';
import 'auth.dart';
import 'root_page.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

void main() => runApp(new MyApp());


class MyApp extends StatelessWidget{

  @override
    Widget build(BuildContext context){

      return new MaterialApp(
        title: 'flutter login demo',
        theme:  ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: RootPage( auth: Auth())
      );   
    }
}
// all ok
