import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todoapp/homepage.dart';

void main() async {
  await Hive.initFlutter();

  final box = await Hive.openBox("my_todo");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Todo App',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: Homepage(),
    );
  }
}
