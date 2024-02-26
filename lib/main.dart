import 'package:flutter/material.dart';
import 'package:todo_task/Screen/MyHomePage.dart';
import 'package:provider/provider.dart';
import 'package:todo_task/Widget/ToDoAction.dart';
import 'package:todo_task/Screen/MyHomePage.dart';
import 'package:todo_task/Model/ToDoModel.dart';
import 'package:todo_task/Provider/ToDoProvider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => ToDoProvider()),
      child: MaterialApp(
        title: 'Simple ToDo App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: MyHome(),
      ),
    );
  }
}
