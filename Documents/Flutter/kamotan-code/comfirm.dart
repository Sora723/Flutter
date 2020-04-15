import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ComfirmScreen extends StatelessWidget{
  final String _inputClassNameText;
  final String _inputProfesNameText;
  final String _valueReview;
  final String _valueScore;
  final String _activeAttend;
  final String _activeBook;
  final String _flagMiddle;
  final String _flagFinal;
  final String _flagReport;
  final String _inputTestBringText;
  final String _inputDetailText;

  ComfirmScreen(
    this._inputClassNameText,
    this._inputProfesNameText,
    this._valueReview,
    this._valueScore,
    this._activeAttend,
    this._activeBook,
    this._flagMiddle,
    this._flagFinal,
    this._flagReport,
    this._inputTestBringText,
    this._inputDetailText,
  );

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("確認画面"),
      ),
      body: Column(
        children: <Widget>[
          Text("$_inputClassNameText"),
          Text("$_inputProfesNameText"),
          Text("$_valueReview"),
          Text("$_valueScore"),
          Text("$_activeAttend"),
          Text("$_activeBook"),
          Text("$_flagMiddle"),
          Text("$_flagFinal"),
          Text("$_flagReport"),
          Text("$_inputTestBringText"),
          Text("$_inputDetailText"),
        ],
      )

    );
  }
}