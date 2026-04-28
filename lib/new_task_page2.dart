import 'package:flutter/material.dart';

class NewTaskPage extends StatelessWidget {
  const NewTaskPage({super.key});

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
        title: Text(
          "New Task",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
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
              "What to be done?",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            TextField(decoration: InputDecoration(hintText: "Enter your task")),
            SizedBox(height: 50),
            Text(
              "Due Date",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(hintText: "Date not set yet"),
                  ),
                ),
                IconButton.filled(
                  onPressed: () async {
                    DateTime? date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    print(date);
                  },
                  icon: Icon(Icons.calendar_month),
                ),
              ],
            ),
            SizedBox(height: 50),
            Text(
              "Add to List",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            DropdownButton(
              isExpanded: true,
              value: "Work",
              items: [
                DropdownMenuItem(value: "Shopping", child: Text("Shopping")),
                DropdownMenuItem(value: "Work", child: Text("Work")),
                DropdownMenuItem(value: "Study", child: Text("Study")),
              ],
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
