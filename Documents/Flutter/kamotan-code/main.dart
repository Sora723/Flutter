import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'comfirm.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '新規授業評価(理工学部)'),

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

  final classNameText = TextEditingController();
  final profesNameText = TextEditingController();
  // final classReviewText = TextEditingController();
  // final classScoreText = TextEditingController();
  // final classAttendText = TextEditingController();
  // final classBookText = TextEditingController();
  // final classTestText = TextEditingController();
  final classTestBringText = TextEditingController();
  final classDetailText = TextEditingController();

  String _inputClassNameText;
  String _inputProfesNameText;
  String _inputTestBringText;
  String _inputDetailText;
  double _valueReview = 0.0;
  double _valueScore = 0.0;
  bool _activeAttend = false;
  bool _activeBook = false;

  bool _flagMiddle = false;
  bool _flagFinal = false;
  bool _flagReport = false;
  

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
          child:Column(
          children: <Widget>[
              Column(
                children: <Widget>[
                  Card( 
                    color: Colors.lightBlue[100],
                    child: Container(
                      padding: EdgeInsets.all(30),
                      child:TextField(
                        controller: classNameText,
                        //obscureText: false,
                        onChanged: changeField,
                        decoration: InputDecoration(
                          //border: OutlineInputBorder(),
                          labelText: '授業名',
                        ),
                      ),
                    ) 
                  ),
                  Card( 
                    color: Colors.lightBlue[200],
                    child: Container(
                      padding: EdgeInsets.all(30),
                      child:TextField(
                        controller: profesNameText,
                        //obscureText: false,
                        onChanged: changeField2,
                        decoration: InputDecoration(
                          //border: OutlineInputBorder(),
                          labelText: '教授名',
                        ),
                      ),
                    ) 
                  ),
                    Card( 
                    color: Colors.lightBlue[100],
                      child: Container(
                        padding: EdgeInsets.all(30),
                        child: Column(
                          children: <Widget>[
                            Text("授業内容充実度"),
                            Row(
                              children: <Widget>[ 
                                Slider(
                                  label: '$_valueReview',
                                  min: 0,
                                  max: 5,
                                  value: _valueReview,
                                  activeColor: Colors.orange,
                                  inactiveColor: Colors.blueAccent,
                                  divisions: 5,
                                  onChanged: _changeSliderValueReview,
                                ),
                                Center(child:Text("値(5点満点)：$_valueReview")),
                              ],
                            ),
                          ],
                        ),
                      ), 
                  ),
                    Card( 
                    color: Colors.lightBlue[200],
                      child: Container(
                        padding: EdgeInsets.all(30),
                        child: Column(
                          children: <Widget>[
                            Text("授業内容充実度"),
                            Row(
                              children: <Widget>[ 
                                Slider(
                                  label: '$_valueScore',
                                  min: 0,
                                  max: 5,
                                  value: _valueScore,
                                  activeColor: Colors.orange,
                                  inactiveColor: Colors.blueAccent,
                                  divisions: 5,
                                  onChanged: _changeSliderValueScore,
                                ),
                                Center(child:Text("値(5点満点)：$_valueScore")),
                              ],
                            ),
                          ],
                        ),
                      ), 
                  ),
                  Card( 
                    color: Colors.lightBlue[100],
                    child: Container(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: <Widget>[
                          new SwitchListTile(
                            value: _activeAttend,
                            activeColor: Colors.orange,
                            activeTrackColor: Colors.red,
                            inactiveThumbColor: Colors.blue,
                            inactiveTrackColor: Colors.grey,
                            secondary: new Icon(
                              Icons.event_note,
                              color: _activeAttend ? Colors.orange[700] : Colors.grey[500],
                              size: 50.0,
                            ),
                            title: Text('出席の有無'),
                            subtitle: Text('出席を取られるかどうか'),
                            onChanged: _changeSwitch,
                          )
                        ],
                      )
                    ) 
                  ),
                  Card( 
                    color: Colors.lightBlue[200],
                    child: Container(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: <Widget>[
                          new SwitchListTile(
                            value: _activeBook,
                            activeColor: Colors.orange,
                            activeTrackColor: Colors.red,
                            inactiveThumbColor: Colors.blue,
                            inactiveTrackColor: Colors.grey,
                            secondary: new Icon(
                              Icons.text_fields,
                              color: _activeBook ? Colors.orange[700] : Colors.grey[500],
                              size: 50.0,
                            ),
                            title: Text('教科書使用の有無'),
                            subtitle: Text('教科書を使用するかどうか'),
                            onChanged: _changeSwitch1,
                          )
                        ],
                      )
                    ) 
                  ),
                  Card( 
                    color: Colors.lightBlue[100],
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          Text("中間期末試験の有無"),
                          CheckboxListTile(
                            activeColor: Colors.blue,
                            title: Text('中間試験あり'),
                            subtitle: Text('中間試験があればチェック'),
                            secondary: new Icon(
                              Icons.fiber_manual_record,
                              color: _flagMiddle ? Colors.orange[700] : Colors.grey[500],
                            ),
                            controlAffinity: ListTileControlAffinity.leading,
                            value: _flagMiddle,
                            onChanged: _handleCheckbox,
                          ),
                          CheckboxListTile(
                            activeColor: Colors.blue,
                            title: Text('期末試験あり'),
                            subtitle: Text('期末試験があればチェック'),
                            secondary: new Icon(
                              Icons.fiber_manual_record,
                              color: _flagFinal ? Colors.orange[700] : Colors.grey[500],
                            ),
                            controlAffinity: ListTileControlAffinity.leading,
                            value: _flagFinal,
                            onChanged: _handleCheckbox1,
                          ),
                          CheckboxListTile(
                            activeColor: Colors.blue,
                            title: Text('レポートあり'),
                            subtitle: Text('レポート提出があればチェック'),
                            secondary: new Icon(
                              Icons.fiber_manual_record,
                              color: _flagReport ? Colors.orange[700] : Colors.grey[500],
                            ),
                            controlAffinity: ListTileControlAffinity.leading,
                            value: _flagReport,
                            onChanged: _handleCheckbox2,
                          ),
                        ],
                      )
                    ),
                  ),
                  Card( 
                    color: Colors.lightBlue[200],
                    child: Container(
                      padding: EdgeInsets.all(30),
                      child:TextField(
                        controller: classTestBringText,
                        //obscureText: false,
                        onChanged: changeField7,
                        decoration: InputDecoration(
                          //border: OutlineInputBorder(),
                          labelText: 'テスト内の持込物\n(テストが無いor持込不可の場合「なし」と記載)',
                        ),
                      ),
                    ) 
                  ),
                  Card( 
                    color: Colors.lightBlue[100],
                    child: Container(
                      padding: EdgeInsets.all(30),
                      child:TextField(
                        controller: classDetailText,
                        //obscureText: false,
                        onChanged: changeField8,
                        decoration: InputDecoration(
                          //border: OutlineInputBorder(),
                          labelText: '講義の内容や追加事項記載欄',
                        ),
                      ),
                    ) 
                  ),
                ],
              ),
              // RaisedButton(  //RaisedButton version.
              //   onPressed: () {},
              //   textColor: Colors.white,
              //   padding: const EdgeInsets.all(0.0),
              //   child: Container(
              //     decoration: const BoxDecoration(
              //       gradient: LinearGradient(
              //         colors: <Color>[
              //           Color(0xFF0D47A1),
              //           Color(0xFF1976D2),
              //           Color(0xFF42A5F5),
              //         ],
              //       ),
              //     ),
              //     padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
              //     child: const Text(
              //       '決 定',
              //       style: TextStyle(fontSize: 20)
              //     ),
              //   ),
              // ),
              FlatButton(
                //input firestore database.
                color: Colors.blue[800],
                textColor: Colors.white,
                disabledColor: Colors.red[100],
                disabledTextColor: Colors.black,
                padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                splashColor: Colors.red,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ComfirmScreen(
                      _inputClassNameText,
                      _inputProfesNameText,
                      _valueReview.toString(),
                      _valueScore.toString(),
                      _activeAttend.toString(),
                      _activeBook.toString(),
                      _flagMiddle.toString(),
                      _flagFinal.toString(),
                      _flagReport.toString(),
                      _inputTestBringText,
                      _inputDetailText,                      
                    )),
                  );
                },
                child: Text(
                  "決 定",
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text('Home'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('next'),
            icon: Icon(Icons.navigate_next),
          ),
        ],

        onTap: (int value){
          if(value == 1)
            Navigator.push(
              context,
              MaterialPageRoute( builder: (context) => 
                ComfirmScreen(
                  _inputClassNameText,
                  _inputProfesNameText,
                  _valueReview.toString(),
                  _valueScore.toString(),
                  _activeAttend.toString(),
                  _activeBook.toString(),
                  _flagMiddle.toString(),
                  _flagFinal.toString(),
                  _flagReport.toString(),
                  _inputTestBringText,
                  _inputDetailText,
                  //input database firecloud.
                ) 
              ), 
            );
        },
      ),
    );
  }

  void changeField(String val) => _inputClassNameText = val;
  void changeField2(String val) => _inputProfesNameText = val;
  void changeField7(String val) => _inputTestBringText = val;
  void changeField8(String val) => _inputDetailText = val;

   void _changeSliderValueReview(double e) => setState(() { _valueReview = e; });
   void _changeSliderValueScore(double e) => setState(() { _valueScore = e; });

   void _changeSwitch(bool e) => setState(() => _activeAttend = e);
   void _changeSwitch1(bool e) => setState(() => _activeBook = e);

    void _handleCheckbox(bool e) {
      setState(() {
        _flagMiddle = e;
      });
    }
    void _handleCheckbox1(bool e) {
      setState(() {
        _flagFinal = e;
      });
    }
    void _handleCheckbox2(bool e) {
      setState(() {
        _flagReport = e;
      });
    }
}






// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Baby Names',
//      home: MyHomePage(),
//    );
//  }
// }

// class MyHomePage extends StatefulWidget {
//  @override
//  _MyHomePageState createState() {
//    return _MyHomePageState();
//  }
// }

// class _MyHomePageState extends State {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(title: Text('Baby Name Votes')),
//      body: _buildBody(context),
//    );
//  }

//  Widget _buildBody(BuildContext context) {
//    return StreamBuilder(  //streamを使うとFirestoreの変更をリアルタイムに取得しviewに反映することができます。
//      stream: Firestore.instance.collection('baby').snapshots(), //ここではBabyを取ってきますよって意味
//      builder: (context, snapshot) {
//        if (!snapshot.hasData) return LinearProgressIndicator();

//        return _buildList(context, snapshot.data.documents);
//      },
//    );
//  }

//  Widget _buildList(BuildContext context, List snapshot) {
//    return ListView(
//      padding: const EdgeInsets.only(top: 20.0),
//      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
//    );
//  }

//  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
//    final record = Record.fromSnapshot(data);

//    return Padding(
//      key: ValueKey(record.name),
//      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//      child: Container(
//        decoration: BoxDecoration(
//          border: Border.all(color: Colors.grey),
//          borderRadius: BorderRadius.circular(5.0),
//        ),
//        child: ListTile(
//          title: Text(record.name),
//          trailing: Text(record.votes.toString()),
//          onTap: () => Firestore.instance.runTransaction((transaction) async {
//                final freshSnapshot = await transaction.get(record.reference);
//                final fresh = Record.fromSnapshot(freshSnapshot);

//                await transaction
//                    .update(record.reference, {'votes': fresh.votes + 1});
//              }),
//        ),
//      ),
//    );
//  }
// }

// class Record {
//  final String name;
//  final int votes;
//  final DocumentReference reference;

//  Record.fromMap(Map map, {this.reference})
//      : assert(map['name'] != null),
//        assert(map['votes'] != null),
//        name = map['name'],
//        votes = map['votes'];

//  Record.fromSnapshot(DocumentSnapshot snapshot)
//      : this.fromMap(snapshot.data, reference: snapshot.reference);

//  @override
//  String toString() => "Record<$name:$votes>";
// }