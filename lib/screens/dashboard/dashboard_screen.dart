import 'package:flutter/material.dart';

class DashBoardScreen extends StatelessWidget {
  DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 201, 108),
        leading: const Icon(
          Icons.notifications,
          size: 35.0,
        ),
      ),
      body: Container(
        height: 42,
        margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            border: Border.all(color: Colors.black26)
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: const TextField(
            decoration: InputDecoration(
              icon: Icon(Icons.search),
              border: InputBorder.none,
            ),
          ),
      ),

      floatingActionButton: FloatingActionButton(
            backgroundColor: Color.fromARGB(255, 3, 221, 119),
            foregroundColor: Colors.black,
            elevation: 5.0,
            onPressed: () {
    // Respond to button press
            },
          child:
            const Icon(Icons.add),
            
      )
    );
  }
}
