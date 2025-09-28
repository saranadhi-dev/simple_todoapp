import 'package:hive/hive.dart';

class TodoDB {
  List list = [];
  final _box = Hive.box("my_todo");

  void initialDB() {
    list = [];
  }

  void loadData() {
    list = _box.get("my_list");
  }

  void updateDB() {
    _box.put("my_list", list);
  }
}
