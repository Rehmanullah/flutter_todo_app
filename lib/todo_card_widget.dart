import 'package:flutter/material.dart';
import 'package:flutter_todo_app/todo_model.dart';
class TodoCardWidget extends StatelessWidget {
  final TodoModel todoModel;

  const TodoCardWidget({super.key, required this.todoModel});

  @override
  Widget build(BuildContext context) {
    return  Card(
      child: ListTile(
        leading: Checkbox(value: todoModel.isCompleted, onChanged: (value) {}),
        title: Text(
          todoModel.taskName,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        subtitle: Text(
          todoModel.date,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        trailing: Text(
          todoModel.category,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: getColor(todoModel.category),
          ),
        ),
      ),
    );
  }
}

Color getColor(String category) {
  switch (category) {
    case "Work":
      return Colors.blue;
      case "Personal":
      return Colors.red;
    case "Shopping":
      return Colors.green;
      case "Finished":
      return Colors.orange;
    default:
      return Colors.black;

  }
}