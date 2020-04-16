import 'package:flutter/material.dart';
import 'dart:math';

class Level11Page extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    //return Scaffold(
      return new MaterialApp(
        title: 'TOEFL3800 LEVEL1-1',
        home: _Level11Page(),
    );
  }
}

class _Level11Page extends StatefulWidget{
  
  _Level11Page({Key key}) : super(key:key);

  @override
  _Level11PageState createState() => new _Level11PageState();
}

class _Level11PageState extends State<_Level11Page>{

  final List<String> words = [
    "provide",
    "merchant",
    "needle",
    "fasten",
    "mental",
    "object",
  ];

  final List<String> meaning = [
    "与える",
    "商人",
    "針",
    "締める",
    "精神の",
    "物体",
  ];

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("TOEFL3800 LEVEL1-1"),
        leading: IconButton(icon:Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pushNamed('/home'),
        ),
      ),


      body:Column(
        children: <Widget>[
          _questionEria(),  //()をつけないとWidgeth型にできない。
          _answerEria(),
        ],
      ),
    );
  }

  Widget _questionEria(){
      return Text(
        words[0],
        style: TextStyle(fontSize: 50),
      );
  }
  Widget _answerEria(){
    return ListView(
      children: <Widget>[
        Card(
          child: Padding(
            child: Text(meaning[0], style: TextStyle(fontSize: 22.0),),
            padding: EdgeInsets.all(40.0)
          ),
        ),
      ],
    );
  }
}