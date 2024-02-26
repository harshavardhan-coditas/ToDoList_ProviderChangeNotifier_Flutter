import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_task/Provider/ToDoProvider.dart';

class ToDoAction extends StatelessWidget {
  const ToDoAction({super.key});

  @override
  Widget build(BuildContext context) {
    final task = Provider.of<ToDoProvider>(context);
    return ListView.builder(
      padding: EdgeInsets.only(top: 20),
      itemCount: task.allTasks.length,
      itemBuilder: (context, index) => Card(
        child: CheckboxListTile(
          value: task.allTasks[index].isCompleted,
          onChanged: (isChecked) {
            task.toggleTaskCompletion(task.allTasks[index]);
          },
          title: Text(
            task.allTasks[index].taskName,
            style: TextStyle(
              decoration: task.allTasks[index].isCompleted
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          ),
          controlAffinity: ListTileControlAffinity.leading,
          secondary: IconButton(
            onPressed: () {
              if (task.allTasks[index].isCompleted) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Confirm Delete'),
                        content:
                            Text('Are you sure you want to delete this task ?'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Cancel')),
                          TextButton(
                              onPressed: () {
                                // Perform deletion logic here
                                task.deleteTask(task.allTasks[index]);
                                Navigator.of(context).pop();
                              },
                              child: Text("Delete"))
                        ],
                      );
                    });
              } else {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Can Not Delete'),
                        content: Text(
                            'You can  not delete task, until its completed'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'))
                        ],
                      );
                    });
              }
            },
            icon: const Icon(Icons.delete),
          ),
        ),
      ),
    );
  }
}
