//ok
import 'package:flutter/material.dart';
import 'package:my_app/home_page.dart';
import 'loginpage.dart';
import 'auth.dart';
import 'home_page.dart';

//ok
class RootPage extends StatefulWidget {
  final BaseAuth auth;
  RootPage({this.auth});
  

  @override
  State<StatefulWidget> createState() => new _RootPageState();
}

//ok
enum AuthStatus {
  notSignedIn,
  signedIn
}
//ok
class _RootPageState extends State<RootPage>{
//ok
  AuthStatus authStatus = AuthStatus.notSignedIn;


  //ok  
  initState() {
    super.initState();
    widget.auth.currentUser().then((userId){
      setState((){
        authStatus = userId == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
      });
    });
  }

  //ok
  void _signedIn(){
    setState(() {
      authStatus = AuthStatus.signedIn;
    });
  }

  void _signedOut(){
    setState(() {
      authStatus = AuthStatus.notSignedIn;
    });
  }
  
  //ok
  @override 
  Widget build(BuildContext context){
    switch (authStatus) {
       case AuthStatus.notSignedIn:
        return  LoginPage(
          auth: widget.auth,
          onSignedIn: _signedIn,
        );
      case AuthStatus.signedIn:
        return  HomePage(
          auth: widget.auth,
          onSignedOut: _signedOut,
        );
    }
    return null;
  }
}
