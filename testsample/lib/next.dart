import 'package:flutter/material.dart';

// class NextPage extends StatelessWidget{
//   final String samkey;
//   NextPage({Key key, this.samkey}): super(key: key);

//   @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//       title: samkey,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Mynextpage(sss: samkey),
//     );
//   }
// }

class Mynextpage extends StatefulWidget{
  Mynextpage({Key key, this.sss}) : super(key: key);
  final String sss;
  @override
  _Mynextpage createState() => _Mynextpage();
}
class _Mynextpage extends State<Mynextpage>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.sss),
        actions: <Widget>[
          RaisedButton(
            child: Text('Back'),
            onPressed: () => Navigator.pop(context)
          ),
        ]
      ),
      body: Text("次のページでございます。"),
    );
  }
}