import "package:flutter/material.dart";

class MemoCard extends StatelessWidget {

  Text content = Text("example");

  RaisedButton rBtn = RaisedButton(
    color: Colors.blue,
    highlightColor: Colors.blue[700],
    colorBrightness: Brightness.dark,
    splashColor: Colors.grey,
    child: Text("c"),
    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    onPressed: () => {

    },
  );

  RaisedButton dBtn = RaisedButton(
    color: Colors.blue,
    highlightColor: Colors.blue[700],
    colorBrightness: Brightness.dark,
    splashColor: Colors.grey,
    child: Text("d"),
    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    onPressed: () => {

    },
  );

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Container(
      height: 80,
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: Row(
        children: <Widget>[
          Container(
            width: width-100-10,
            child: content,
          ),
          Container(
            width: 100,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 50,
                  child: rBtn
                ),
                SizedBox(
                  width: 50,
                  child: dBtn,
                )
              ],
            ),
          )
        ],
      )
    );
  }
}

class ListSeperator extends StatelessWidget {
  String title = "";
  ListSeperator(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      child: Text(title),
      color: Colors.grey
    );
  }
}