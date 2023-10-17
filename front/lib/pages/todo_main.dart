import 'package:flutter/material.dart';
import 'package:front/pages/todo_list.dart';
import 'package:front/pages/top.dart';

class TodoMain extends StatefulWidget {
  const TodoMain({super.key});

  @override
  State<TodoMain> createState() {
    return _TodoMainState();
  }
}

class _TodoMainState extends State<TodoMain> {
  var currentPage = 'todo_top_page';

  void switchPage() {
    setState(() {
      currentPage = 'todo_list_page';
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 15, 155, 20),
                Color.fromARGB(255, 138, 210, 140)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
            )
          ),
          child: currentPage == 'todo_top_page'
              ? TopPage(switchPage)
              : const TodoList(),
        ),
      ),
    );
  }
}