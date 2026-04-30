import 'package:flutter/material.dart';

class NewTaskPage extends StatelessWidget {
  const NewTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text(
          "Add New Task",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        leading: IconButton.filled(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          right: 20,
          left: 20,
          top: 20,
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What to add",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            TextField(decoration: InputDecoration(hintText: "Enter task name")),
            SizedBox(height: 30),
            Text(
              "Due date",
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
                  onPressed: ()async {
                   DateTime? date= await showDatePicker(
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
            SizedBox(height: 30,),
            Text(
              "Put in List",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            DropdownButton(
              isExpanded: true,
              value: "Study",
              items: [
                DropdownMenuItem(value: "Shopping", child: Text("Shopping", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),
                DropdownMenuItem(value: "Study", child: Text("Study", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),
                DropdownMenuItem(value: "Personal", child: Text("Personal", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),
                DropdownMenuItem(value: "Shopping", child: Text("Shopping", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),

              ],
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
