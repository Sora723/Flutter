import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth.dart';

//ok
class LoginPage extends StatefulWidget{  
  LoginPage({this.auth, this.onSignedIn});
  final BaseAuth auth;
  final VoidCallback onSignedIn;

  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}


enum FormType{
  login,
  register
}


class _LoginPageState extends State<LoginPage>{

  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  FormType _formType = FormType.login;

  bool validateAndSave(){
    final form = formKey.currentState;
    if(form.validate()){
      form.save();
      return true;
    }
    return false;
  }



  void validateAndSubmit() async {
    if(validateAndSave()){
      try{
        if(_formType == FormType.login){
          String userId = await widget.auth.signInWithEmailAndPassword(_email, _password);
          print('Signed in: $userId');
        } else {
          
          String userId = await widget.auth.createUserEmailAndPassword(_email, _password);
          print('Registered user: $userId');
        }
       widget.onSignedIn();
      }catch(e){
        print('Error: $e');
      }
    } 
  }
  

  void moveToRegister(){
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
    }); 
  }


  void moveToLogin(){
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.login;
    }); 
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter login demo'),
      ),
      body:  Container(
        padding: EdgeInsets.all(20),
        child:  Form(
          key: formKey,
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: buildInputs() + buildsubmitButtons(),
          ),
        ),
      ),
    );
  }

  List<Widget> buildInputs(){
    return[
       TextFormField(
        decoration:  InputDecoration(labelText: 'Email'),
        validator: (value) =>value.isEmpty ? 'Email can not be empty' : null,
        onSaved: (value) => _email = value, 
      ),
       TextFormField(
        decoration:  InputDecoration(labelText: 'password'),
        obscureText: true,
        validator: (value) =>value.isEmpty ? 'password can not be empty' : null,
        onSaved: (value) => _password = value,
      ),
    ];
  }


  List<Widget> buildsubmitButtons(){
  if(_formType == FormType.login){
    return[
       RaisedButton(
       child:  Text('Log In', style:  TextStyle(fontSize: 32),),
       onPressed: validateAndSubmit,
      ),
       FlatButton(
        child:  Text('Create an account', style:  TextStyle(fontSize: 20)),
        onPressed: moveToRegister,
      )
    ];
  }else{
    return[
       RaisedButton(
       child:  Text('Create an account!!', style:  TextStyle(fontSize: 32),),
       onPressed: validateAndSubmit,
      ),
       FlatButton(
        child:  Text('Have an account? Login', style:  TextStyle(fontSize: 20)),
        onPressed: moveToLogin,
      )
    ];
  }
  }
}