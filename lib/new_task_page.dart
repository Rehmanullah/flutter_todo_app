import 'package:flutter/material.dart';
import 'package:flutter_todo_app/todo_model.dart';

class NewTaskPage extends StatefulWidget {
  final Function(TodoModel) addToList;
  const NewTaskPage({super.key, required this.addToList});

  @override
  State<NewTaskPage> createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  TextEditingController newTaskController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();
  String dropDownValue = "Work";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton.filled(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text(
          "Add New Task",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 20,
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What to be done",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            TextField(
              controller: newTaskController,
              decoration: InputDecoration(hintText: "Enter new task"),
            ),
            SizedBox(height: 20),
            Text(
              "Due Date",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Row(
              children: [
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: dueDateController,
                    decoration: InputDecoration(hintText: "Date not set yet"),
                  ),
                ),
                IconButton.filled(
                  onPressed: () async {
                    DateTime? date = await showDatePicker(
                      context: (context),
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    dueDateController.text = date.toString().substring(0, 10);
                    print(date);
                  },
                  icon: Icon(Icons.calendar_month),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Add to a list",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            DropdownButton(
              isExpanded: true,
              value: dropDownValue,
              items: [
                DropdownMenuItem(value: "Work", child: Text("Work")),
                DropdownMenuItem(value: "Study", child: Text("Study")),
                DropdownMenuItem(value: "Shopping", child: Text("Shopping")),
                DropdownMenuItem(value: "Personal", child: Text("Personal")),
              ],
              onChanged: (value) {
                dropDownValue = value!;
                setState(() {});
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.addToList(
            TodoModel(
              taskName: newTaskController.text,
              date: dueDateController.text,
              category: dropDownValue,
              isCompleted: false,
            ),
          );
          Navigator.pop(context);
        },
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: Icon(Icons.check),
      ),
    );
  }
}
