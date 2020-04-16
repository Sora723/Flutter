import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ComfirmScreen extends StatelessWidget{
  final String _value;
  final String _value2;
  final String _value3;
  final String _value4;
  final String _value5;
  final String _value6;
  final String _value7;
  final String _value8;

  ComfirmScreen(this._value, this._value2, this._value3, this._value4, this._value5, this._value6, this._value7, this._value8);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("確認画面"),
      ),
      body: Column(
        children: <Widget>[
          Text("$_value"),
          Text("$_value2"),
          Text("$_value3"),
          Text("$_value4"),
          Text("$_value5"),
          Text("$_value6"),
          Text("$_value7"),
          Text("$_value8"),
        ],
      )

    );
  }
}