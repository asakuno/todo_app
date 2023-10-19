import 'package:flutter/material.dart';

class TodoCreate extends StatefulWidget {
  const TodoCreate({super.key});

  @override
  State<TodoCreate> createState() {
    return _TodoCreateState();
  }
}

class _TodoCreateState extends State<TodoCreate> {
  @override
  Widget build(context) {
    return Center(
    child: Scaffold(
        appBar: AppBar(title: const Text('create todo')),
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
            const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'タイトルを入力してください',
              ),
              autofocus: true,
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              child: Text('新規登録'),
              onPressed: () {},
            )
          ]),
        )));
  }
}
