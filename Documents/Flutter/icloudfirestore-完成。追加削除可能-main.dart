import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CollectionReference _movieCollection = Firestore.instance.collection("movie_to_vote");

  final _textMovieControlle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder(
        stream: _movieCollection.snapshots(),
        builder: (context, snapshot){
          switch (snapshot.connectionState){
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
              // break;
            default:
              return ListView.builder(  //Text("Success");
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index){
                  return _mainContent(snapshot.data.documents[index]);
                },
              );
          }
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
            barrierDismissible: true, //これはアラートのところ以外触ったら戻るような仕様になるか否か
            context: context,
            builder: (context){
              _textMovieControlle.clear(); // テキストコントローラーを空白に戻す
              return AlertDialog(
                title: Text("Add new movie to vote"),
                content: TextField(controller: _textMovieControlle),
                actions: <Widget>[
                  FlatButton(
                    child: Text("close"),
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                  ),
                  FlatButton(
                    child: Text("save"),
                    onPressed: (){
                      _movieCollection.document().setData({
                          "name": _textMovieControlle.text,
                          "votes": 0,
                      }).whenComplete(() => Navigator.of(context).pop());
                    },
                  ),
                ],
              );
            }
          );
        }
      ), 
    );
  }

  Widget _mainContent(DocumentSnapshot data){
      return ListTile(
        //ここは解放したらタップした分だけ数字がリアルタイムで増える。
        // onTap: (){
        //   data.reference.updateData({"votes": data["votes"]+1});
        // },
        onLongPress: (){
          DocumentSnapshot dataPress = data;
          showDialog(
            barrierDismissible: true, //これはアラートのところ以外触ったら戻るような仕様になるか否か
            context: context,
            builder: (context){
              _textMovieControlle.clear(); // テキストコントローラーを空白に戻す
              return AlertDialog(
                title: Text("Delete movie"),
                content: Text(dataPress["name"], style: TextStyle(fontSize: 18)),
                actions: <Widget>[
                  FlatButton(
                    child: Text("close"),
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                  ),
                  FlatButton(
                    child: Text("delete"),
                    onPressed: (){
                      dataPress.reference.delete();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            }
          );
        },
        title: Text(data["name"]), 
        trailing: Text(data["votes"].toString(), style: TextStyle(fontSize: 24)));
  }
}
