import 'package:flutter/material.dart';
import 'package:flutter_demo/MemoMgr.dart';
import 'package:flutter_demo/MemoModel.dart';
import './MemoListDelegate.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MemoPage(),
    );
  }
}

class MemoPage extends StatefulWidget {
  @override
  _MemoPageState createState() => _MemoPageState();
}

class _MemoPageState extends State<MemoPage> {

  ListView listView;
  MemoListDelegate listViewDelegate;

  _MemoPageState() {
  }

  @override
  void initState() {
    this.listViewDelegate = MemoListDelegate(this);
    this.listView = ListView.custom(childrenDelegate: this.listViewDelegate);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Memo'),
      ),
      body: Center(
        child: this.listView,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          MemoModel model = MemoModel(DateTime.now().millisecondsSinceEpoch.toString(), DateTime.now().millisecondsSinceEpoch.toString(), false, false);
          MemoMgr.addMemo(model).then((n) {
            // this.listViewDelegate.build(context, index)
          });
        },
      )
    );
  }
}

// MARK: -- example code -- //

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.display1,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
