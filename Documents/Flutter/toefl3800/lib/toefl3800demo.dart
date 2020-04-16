import 'package:flutter/material.dart';
//import 'main.dart';

class DemoPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    //return Scaffold(
      return new MaterialApp(
        title: 'toefldemo',
        home: _DemoPage(),
    );
  }
}

class _DemoPage extends StatefulWidget{
  
  _DemoPage({Key key}) : super(key:key);

  @override
  _DemoPageState createState() => new _DemoPageState();
}

class _DemoPageState extends State<_DemoPage>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("toefl3800 demo"),
      ),

      body: Text("demo"),
    );
  }

}