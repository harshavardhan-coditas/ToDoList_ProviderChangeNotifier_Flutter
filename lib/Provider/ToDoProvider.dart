import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_task/Model/ToDoModel.dart';
import 'dart:collection';

class ToDoProvider with ChangeNotifier {
  List<TaskItem> _tasks = [];
  UnmodifiableListView<TaskItem> get allTasks => UnmodifiableListView(_tasks);
  void addTask(String taskName) {
    _tasks.add(TaskItem(taskName: taskName));
    notifyListeners();
  }

  void toggleTaskCompletion(TaskItem task) {
    task.isCompleted = !task.isCompleted;
    notifyListeners();
  }

  void deleteTask(TaskItem task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
