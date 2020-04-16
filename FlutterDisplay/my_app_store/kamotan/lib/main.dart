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
      home: MyHomePage(title: '新規授業評価'),

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
  final classReviewText = TextEditingController();
  final classScoreText = TextEditingController();
  final classAttendText = TextEditingController();
  final classBookText = TextEditingController();
  final classTestText = TextEditingController();
  final classTestBringText = TextEditingController();

  String _input;
  String _input2;
  String _input3;
  String _input4;
  String _input5;
  String _input6;
  String _input7;
  String _input8;
  double _value = 0.0;

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Card(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: classNameText,
                  //obscureText: false,
                  onChanged: changeField,
                  decoration: InputDecoration(
                    //border: OutlineInputBorder(),
                    labelText: '授業名',
                  ),
                ),
                // TextField(r
                //   controller: profesNameText,
                //   //obscureText: false,
                //   onChanged: changeField2,
                //   decoration: InputDecoration(
                //     //border: OutlineInputBorder(),
                //     labelText: '教授名',
                //   ),
                // ),

                //Center(child:Text("現在の値：${_value}")),
                Slider(
                  //label: '${_value}',
                  min: 0,
                  max: 5,
                  value: _value,
                  activeColor: Colors.orange,
                  inactiveColor: Colors.blueAccent,
                  divisions: 5,
                  onChanged: _changeSlider,
                ),

                // TextField(
                //   controller: classReviewText,
                //   //obscureText: false,
                //   onChanged: changeField3,
                //   decoration: InputDecoration(
                //     //border: OutlineInputBorder(),
                //     labelText: '授業内容充実度(5点満点)',
                //   ),
                // ),
                TextField(
                  controller: classScoreText,
                  //obscureText: false,
                  onChanged: changeField4,
                  decoration: InputDecoration(
                    //border: OutlineInputBorder(),
                    labelText: '授業単位取得度(5点満点)',
                  ),
                ),
                TextField(
                  controller: classAttendText,
                  //obscureText: false,
                  onChanged: changeField5,
                  decoration: InputDecoration(
                    //border: OutlineInputBorder(),
                    labelText: '出席',
                  ),
                ),
                TextField(
                  controller: classBookText,
                  //obscureText: false,
                  onChanged: changeField6,
                  decoration: InputDecoration(
                    //border: OutlineInputBorder(),
                    labelText: '教科書',
                  ),
                ),
                TextField(
                  controller: classTestText,
                  //obscureText: false,
                  onChanged: changeField7,
                  decoration: InputDecoration(
                    //border: OutlineInputBorder(),
                    labelText: '中間期末テストの有無',
                  ),
                ),
                TextField(
                  controller: classTestBringText,
                  //obscureText: false,
                  onChanged: changeField8,
                  decoration: InputDecoration(
                    //border: OutlineInputBorder(),
                    labelText: 'テスト中の持ち込み可能物',
                  ),
                ),
              ],
            ),
          ),

        ],
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
              MaterialPageRoute( builder: (context) => ComfirmScreen(_input, _input2, _input3, _input4, _input5, _input6, _input7, _input8) ), 
            );
        },
      ),
    );
  }

  void changeField(String val) => _input = val;
  void changeField2(String val) => _input2 = val;
  void changeField3(String val) => _input3 = val;
  void changeField4(String val) => _input4 = val;
  void changeField5(String val) => _input5 = val;
  void changeField6(String val) => _input6 = val;
  void changeField7(String val) => _input7 = val;
  void changeField8(String val) => _input8 = val;

   void _changeSlider(double e) => setState(() { _value = e; });
}
