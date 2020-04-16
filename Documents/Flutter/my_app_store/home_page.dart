import 'package:flutter/material.dart';
import 'auth.dart';

class HomePage extends StatelessWidget {
  HomePage({this.auth, this.onSignedOut});
  final BaseAuth auth;
  final VoidCallback onSignedOut;

  void _signOut() async{
    try {
      await auth.signOut();
      onSignedOut();
    } catch(e) {
      print(e);
    }
  }

  @override 
  Widget build(BuildContext context){
    return  Scaffold(
      appBar:  AppBar(
        title:  Text('welcom'),
        actions: <Widget>[
           FlatButton(
            child:  Text('logout', style: TextStyle(fontSize: 17, color:Colors.white)),
            onPressed: _signOut,
          )
        ],
      ),
      body:  Container(
        child:  Center(
          child:  Text('welcome', style: TextStyle(fontSize: 32)),
        ),
      ),
    );
  }
}