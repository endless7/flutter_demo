import 'package:flutter/material.dart';
import 'package:flutter_demo/MemoMgr.dart';
import 'package:flutter_demo/MemoModel.dart';
import "./MemoCard.dart";

class MemoListDelegate extends SliverChildDelegate {

  MemoListDelegate(State state) {
    MemoMgr.getAllMemo().then((models) {
      MemoMgr.shared.models = models;
      state.setState((){});
    });
  }

  /// 根据index构造child
  @override
  Widget build(BuildContext context, int index) {
    int sum = MemoMgr.shared.models.length;

    for (var i = 0; i < sum; i++) {
      
    }

    if (index == 0) {
      return ListSeperator("未完成");
    }else if(index == 5) {
      return ListSeperator("已完成");
    }

    return MemoCard(MemoModel(1, "example", true, true));
  }

  @override
  bool shouldRebuild(SliverChildDelegate oldDelegate) {
    return false;
  }

  /// 提高children的count，当无法精确知道时返回null。
  /// 当 build 返回 null时，它也将需要返回一个非null值
  @override
  int get estimatedChildCount => 100;

  /// 预计最大可滑动高度，如果设置的过小会导致部分child不可见，设置报错
  @override
  double estimateMaxScrollOffset(int firstIndex, int lastIndex,
      double leadingScrollOffset, double trailingScrollOffset) {
    return 2500;
  }

  /// 完成layout后的回调，可以通过该方法获已完成布局的视图树包括哪些子控件
  @override
  void didFinishLayout(int firstIndex, int lastIndex) {
    // print('didFinishLayout firstIndex=$firstIndex firstIndex=$lastIndex');
  }
}