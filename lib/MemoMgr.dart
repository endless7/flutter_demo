import 'dart:convert' as convert;
import 'package:shared_preferences/shared_preferences.dart';
import './MemoModel.dart';

const String Key = "memo_key";

class MemoMgr {

  static MemoMgr shared = MemoMgr();

  List<MemoModel> models = List<MemoModel>();

  // ---  CRUD --- //

  static Future<List<MemoModel>> getAllMemo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> strList = prefs.getStringList(Key);

    List<MemoModel> models = List<MemoModel>();

    for (var str in strList) {
      Map map = convert.jsonDecode(str);
      MemoModel model = MemoModel.fromJson(map);
      models.add(model);
    }

    return models; 
  } 

  static void syncMemo(List<MemoModel> models) async {

    if (models.length == 0 || models == null) {
      return;
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> strList = List<String>();

    for (var model in models) {
      Map map = model.toJson();
      String str = convert.jsonEncode(map);
      strList.add(str);
    }

    prefs.setStringList(Key, strList);
  }

  static void saveMemoModel(MemoModel model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> jsonList = prefs.getStringList(Key);

    Map map = model.toJson();
    String str = convert.jsonEncode(map);

    if (jsonList == null) {
      prefs.setStringList(Key, [str]);
    }else{
      jsonList.add(str);
      prefs.setStringList(Key, jsonList);
    }
  }
}