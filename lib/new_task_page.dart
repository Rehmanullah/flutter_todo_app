import 'package:flutter/material.dart';

class NewTaskPage extends StatelessWidget {
  const NewTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton.filled(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new_rounded)),
        title: Text(
          "New Task",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(child: Text("New Page")),
    );
  }
}
