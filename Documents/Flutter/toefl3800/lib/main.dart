import 'package:flutter/material.dart';
import 'toefl3800demo.dart';
import 'level1_1page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TOEFL英単語帳開発',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'TOEFL3800'),
      
      initialRoute: '/home',
      routes: {
        //'/home'    : (BuildContext context) => new MyHomePage(),
        '/level1-1': (BuildContext context) => new Level11Page(),
        '/level1-2': (BuildContext context) => new DemoPage(),
        '/level1-3': (BuildContext context) => new DemoPage(),
        '/level1-4': (BuildContext context) => new DemoPage(),
        '/level1-5': (BuildContext context) => new DemoPage(),
        '/level1-6': (BuildContext context) => new DemoPage(),
        '/level1-7': (BuildContext context) => new DemoPage(),
        '/level2-1': (BuildContext context) => new DemoPage(),
        '/level2-2': (BuildContext context) => new DemoPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{

  //   var _items = <Widget>[

  //   Container(
  //       padding: EdgeInsets.all(15),
  //       child:Text("TOEFL3800 demo", style: TextStyle(fontSize: 32)),
  //     ),
  //   Container(
  //     padding: EdgeInsets.all(15),
  //     child:Text("TOEFL3800 level1-1", style: TextStyle(fontSize: 32)),
  //   ),
  //   Container(
  //     padding: EdgeInsets.all(15),
  //     child:Text("TOEFL3800 level1-2", style: TextStyle(fontSize: 32)),
  //   ),
  //   Container(
  //     padding: EdgeInsets.all(15),
  //     child:Text("TOEFL3800 level1-3", style: TextStyle(fontSize: 32)),
  //   ),
  //   Container(
  //     padding: EdgeInsets.all(15),
  //     child:Text("TOEFL3800 level1-4", style: TextStyle(fontSize: 32)),
  //   ),
  //   Container(
  //     padding: EdgeInsets.all(15),
  //     child:Text("TOEFL3800 level1-5", style: TextStyle(fontSize: 32)),
  //   ),
  //   Container(
  //     padding: EdgeInsets.all(15),
  //     child:Text("TOEFL3800 level1-6", style: TextStyle(fontSize: 32)),
  //   ),
  //   Container(
  //     padding: EdgeInsets.all(15),
  //     child:Text("TOEFL3800 level1-7", style: TextStyle(fontSize: 32)),
  //   ),
  //   Container(
  //     padding: EdgeInsets.all(15),
  //     child:Text("TOEFL3800 level2", style: TextStyle(fontSize: 32)),
  //   ),
  //   Container(
  //     padding: EdgeInsets.all(15),
  //     child:Text("TOEFL3800 level3", style: TextStyle(fontSize: 32)),
  //   ),
  //   Container(
  //     padding: EdgeInsets.all(15),
  //     child:Text("TOEFL3800 level4", style: TextStyle(fontSize: 32)),
  //   ),
  // ];

  Widget build(BuildContext context){
    return Scaffold(
      
      appBar: AppBar(
        title: Text(widget.title),
      ),
      
      body: CustomScrollView(

        slivers: <Widget>[

          SliverAppBar(
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("TOEFL LIST"),
            ),
          
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.android),
                tooltip: 'icon button',
                onPressed: (){ print("pressed.");},
              )
            ],
          ),

          SliverList(
            delegate: new SliverChildListDelegate(
                [ 

                  FlatButton(
                    key: null,
                    onPressed: () => Navigator.of(context).pushNamed('/level1-1'),
                    child: Text("TOEFL3800 level1-1", style: TextStyle(fontSize: 32, color: Colors.black)),
                  ),
                  FlatButton(
                    key: null,
                    onPressed: () => Navigator.of(context).pushNamed('/level1-2'),
                    child: Text("TOEFL3800 level1-2", style: TextStyle(fontSize: 32, color: Colors.black)),
                  ),
                  FlatButton(
                    key: null,
                    onPressed: () => Navigator.of(context).pushNamed('/level1-3'),
                    child: Text("TOEFL3800 level1-3", style: TextStyle(fontSize: 32, color: Colors.black)),
                  ),
                  FlatButton(
                    key: null,
                    onPressed: () => Navigator.of(context).pushNamed('/level1-4'),
                    child: Text("TOEFL3800 level1-4", style: TextStyle(fontSize: 32, color: Colors.black)),
                  ),
                  FlatButton(
                    key: null,
                    onPressed: () => Navigator.of(context).pushNamed('/level1-5'),
                    child: Text("TOEFL3800 level1-5", style: TextStyle(fontSize: 32, color: Colors.black)),
                  ),
                  FlatButton(
                    key: null,
                    onPressed: () => Navigator.of(context).pushNamed('/level1-6'),
                    child: Text("TOEFL3800 level1-6", style: TextStyle(fontSize: 32, color: Colors.black)),
                  ),
                  FlatButton(
                    key: null,
                    onPressed: () => Navigator.of(context).pushNamed('/level1-7'),
                    child: Text("TOEFL3800 level1-7", style: TextStyle(fontSize: 32, color: Colors.black)),
                  ),
                  FlatButton(
                    key: null,
                    onPressed: () => Navigator.of(context).pushNamed('/level2-1'),
                    child: Text("TOEFL3800 level2-1", style: TextStyle(fontSize: 32, color: Colors.black)),
                  ),
                  FlatButton(
                    key: null,
                    onPressed: () => Navigator.of(context).pushNamed('/level2-2'),
                    child: Text("TOEFL3800 level2-2", style: TextStyle(fontSize: 32, color: Colors.black)),
                  ),
                  
                ],
            ),
          )],
      ),
    );
  }
}