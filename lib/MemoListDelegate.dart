import 'package:flutter/material.dart';
import "./MemoCard.dart";

class MemoListDelegate extends SliverChildDelegate {

  MemoListDelegate() {
    // this.child
  }

  /// 根据index构造child
  @override
  Widget build(BuildContext context, int index) {
    // KeepAlive将把所有子控件加入到cache，已输入的TextField文字不会因滚动消失
    // 仅用于演示
    // return KeepAlive(
        // keepAlive: true,
        // child: TextField(decoration: InputDecoration(hintText: '请输入')));

    if (index > 10) {
      return null;
    }else if(index == 5) {

    }

    return ListTile(title: Text("普通ListView"));
  }

  /// 决定提供新的childDelegate时是否需要重新build。在调用此方法前会做类型检查，不同类型时才会调用此方法，所以一般返回true。
  @override
  bool shouldRebuild(SliverChildDelegate oldDelegate) {
    return true;
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