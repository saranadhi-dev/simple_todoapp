import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todoapp/database.dart';
import 'package:todoapp/todotile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _box = Hive.box("my_todo");
  TodoDB db = TodoDB();

  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (_box.get("my_list") == null) {
    } else {
      db.loadData();
    }
  }

  void onChange(bool? v, int index) {
    setState(() {
      db.list[index][1] = !(db.list[index][1]);
    });
    db.updateDB();
  }

  void addTodo() {
    setState(() {
      db.list.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
    _controller.clear();
    db.updateDB();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: BoxBorder.all(),
          content: Container(
            height: 125,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Add New Todo",
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      color: Colors.blueGrey,
                      child: Text("Cancel"),
                    ),
                    MaterialButton(
                      onPressed: addTodo,
                      color: Colors.blueGrey,
                      child: Text("Save"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.list.removeAt(index);
    });
    db.updateDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("T O D O"),
        centerTitle: true,
        elevation: 0,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.refresh))],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.black54,
        child: const Icon(Icons.add, color: Colors.black54),
      ),
      body: ListView.builder(
        itemCount: db.list.length,
        itemBuilder: (context, index) {
          return Todotile(
            task: db.list[index][0],
            isCompleted: db.list[index][1],
            onChange: (v) => onChange(v, index),
            onDelete: (context) {
              deleteTask(index);
            },
          );
        },
      ),
    );
  }
}
