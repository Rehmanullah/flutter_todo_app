import 'package:flutter/material.dart';
import 'package:flutter_todo_app/data.dart';
import 'package:flutter_todo_app/todo_card_widget.dart';
import 'package:flutter_todo_app/todo_model.dart';

import 'new_task_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void addToList(TodoModel todoModel) {
    listOfTodo.add(todoModel);
    setState(() {});
  }

  List<TodoModel> listOfTodo = [
    TodoModel(
      taskName: "Task 1",
      date: "12-04-2026",
      category: "Finished",
      isCompleted: false,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (child) => NewTaskPage(addToList: addToList),
            ),
          );
        },
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text(
          "Todo App",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: [
          // PopupMenuButton(itemBuilder: (context)=> [
          //   PopupMenuItem(child: Text("All List", style: TextStyle(fontWeight: FontWeight.bold),),),
          //   PopupMenuItem(child: Text("Pending"),),
          // ],),
          PopupMenuButton(
            itemBuilder: (context) => popUpMenuItemsTitleList
                .map((e) => PopupMenuItem(child: Text((e))))
                .toList(),
          ),
        ],
      ),
      body: ListView(
        // children: [
        //   TodoCardWidget(
        //     todoModel: TodoModel(
        //       taskName: "Task 1",
        //       date: "12-04-2026",
        //       category: "Finished",
        //       isCompleted: false,
        //     ),
        //   ),
        //   TodoCardWidget(
        //     todoModel: TodoModel(
        //       taskName: "Task 1",
        //       date: "12-04-2026",
        //       category: "Finished",
        //       isCompleted: false,
        //     ),
        //   ),
        //   TodoCardWidget(
        //     todoModel: TodoModel(
        //       taskName: "Task 1",
        //       date: "12-04-2026",
        //       category: "Finished",
        //       isCompleted: false,
        //     ),
        //   ),
        //   TodoCardWidget(
        //     todoModel: TodoModel(
        //       taskName: "Task 1",
        //       date: "12-04-2026",
        //       category: "Finished",
        //       isCompleted: false,
        //     ),
        //   ),
        // ],
        children: listOfTodo.map((e) => TodoCardWidget(todoModel: e)).toList(),
      ),
    );
  }
}
