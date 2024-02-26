import 'package:flutter/material.dart';

class TaskItem {
  String taskName;
  bool isCompleted;
  TaskItem({required this.taskName, this.isCompleted = false});
  void toggleCompleted() {
    isCompleted = !isCompleted;
  }
}
