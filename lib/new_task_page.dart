import 'package:flutter/material.dart';

class NewPageTask extends StatelessWidget {
  const NewPageTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("New Page", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
