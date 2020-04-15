import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'icloudFirestore',
      theme: ThemeData(
        // primarySwatch: Colors.purple,
      ),
      home: MyHomePage(title: 'LINEもどき(Demo)'),
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

  var a = 65;
  var b = 65;
  //これはaddやgetをコレクションからするおまじない。(ex)
  //Firestore.instance.collection('books').document().setData({ 'title': 'title', 'author': 'author' });
  final CollectionReference _movieCollection = Firestore.instance.collection("sampleUsers");

  //かけるテキストを追加
  final _textMovieControlle = TextEditingController();

  @override
  Widget build(BuildContext context) {

    Future <bool> onBackPress() {
        Navigator.pop(context);
        return Future.value(false);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.purple[200],
      ),
      body: WillPopScope(
        child:StreamBuilder(
          // //表示したいFiresotreの保存先を指定
          // stream: Firestore.instance
          // .collection('sampleUsers')
          // .document()
          // .collection("transaction")
          // //.snapshots()を記載してデータを取得します。
          // .snapshots(),

          stream: _movieCollection.snapshots(),
          //streamが更新されるたびに呼ばれる
          builder: (context, snapshot){
            //ここのswitchはデータがsnapshotによりデータが取得されているか確認している。
            switch (snapshot.connectionState){
              case ConnectionState.waiting: //if fault
                return Center(child: CircularProgressIndicator());
              default:                      //if success
                return ListView.builder(  //Text("Success");
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index){
                    return _mainContent(snapshot.data.documents[index]);//_mainContent Widgetを呼び出す
                  },
                );
            }
          }
        ), onWillPop: onBackPress,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
            barrierDismissible: false, //これはアラートのところ以外触ったら戻るような仕様になるか否か
            context: context,
            builder: (context){
              // _textMovieControlle.clear(); // テキストコントローラーを空白に戻す(ここに置くと書いてもすぐに消されちゃう)
              return AlertDialog(
                title: Text("Add new message"),
                content: TextField(controller: _textMovieControlle),
                actions: <Widget>[
                  FlatButton(
                    child: Text("close"),
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                  ),
                  FlatButton(
                    child: Text("send"),
                    onPressed: (){
                      String docid = String.fromCharCodes([a,b]);
                      _movieCollection.document(docid).setData({
                          "message": _textMovieControlle.text,
                      }).whenComplete(() => Navigator.of(context).pop());
                      _textMovieControlle.clear(); 
                      if(b==90){a++;}

                      if(b != 90){b++;}
                      else if(b==90){b=65;}
                    },
                  ),
                ],
              );
            }
          );
        },
      child: Icon(Icons.send),
      ), 
    );
  }

  Widget _mainContent(DocumentSnapshot data){
      return ListTile(
        //ここは解放したらタップした分だけ数字がリアルタイムで増える。
        // onTap: (){
        //   data.reference.updateData({"number": data["number"]+1});
        // },
        onLongPress: (){
          DocumentSnapshot dataPress = data;
          showDialog(
            barrierDismissible: true, //これはアラートのところ以外触ったら戻るような仕様になるか否か
            context: context,
            builder: (context){
              return AlertDialog(
                title: Text("Delete message"),
                content: Text(dataPress["message"], style: TextStyle(fontSize: 18)),
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
        //title: Text(data["message"]),
        trailing: Text(data["message"].toString(), style: TextStyle(fontSize: 30)));
  }
}
