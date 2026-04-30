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
            TextField(decoration: InputDecoration(hintText: "Enter new task")),
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
                    decoration: InputDecoration(hintText: "Date not set yet"),
                  ),
                ),
                IconButton.filled(
                  onPressed: () async{
                    DateTime? date = await showDatePicker(
                      context: (context),
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
            SizedBox(height: 20,),
            Text("Add to a list", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
            DropdownButton(
              isExpanded: true,
                value: "Study",
                items: [
              DropdownMenuItem(value: "Work",child: Text("Work"),),
              DropdownMenuItem(value: "Study",child: Text("Study"),),

            ], onChanged: (value){

            }),
          ],
        ),
      ),
    );
  }
}
