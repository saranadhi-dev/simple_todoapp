import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/homepage.dart';
import 'package:todoapp/theme.dart';
import 'package:todoapp/themeProvider.dart';

void main() async {
  await Hive.initFlutter();

  final box = await Hive.openBox("my_todo");

  runApp(
    ChangeNotifierProvider(
      create: (context) => Themeprovider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Todo App',
      // theme: lightMode,
      // darkTheme: darkMode,
      theme:  Provider.of<Themeprovider>(context).themeData,
      home: Homepage(),
    );
  }
}
