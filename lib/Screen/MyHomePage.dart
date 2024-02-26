import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_task/Widget/ToDoAction.dart';
import 'package:todo_task/Model/ToDoModel.dart';
import 'package:todo_task/Provider/ToDoProvider.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade100,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade400,
        title: Text(
          'To Do List',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 32,
            color: Colors.white,
          ),
        ),
      ),
      body: ToDoAction(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddTaskDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void showAddTaskDialog(BuildContext context) {
    TextEditingController taskController = TextEditingController();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Add Task'),
            content: TextField(
              controller: taskController,
              decoration: InputDecoration(hintText: 'Enter your task'),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel')),
              TextButton(
                  onPressed: () {
                    String newTask = taskController.text;
                    if (newTask.isNotEmpty) {
                      Provider.of<ToDoProvider>(context, listen: false)
                          .addTask(newTask);
                    }
                    Navigator.of(context).pop();
                  },
                  child: Text('Add'))
            ],
          );
        });
  }
}
