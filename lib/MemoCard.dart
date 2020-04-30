import "package:flutter/material.dart";

class MemoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(" hello world "),
          Text(" I am Jack "),
        ],
      )
    );
  }
}

class ListSeperator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return null;
  }
}