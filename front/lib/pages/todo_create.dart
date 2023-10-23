import 'package:flutter/material.dart';
import 'package:front/repository/todo_request.dart';
import 'package:front/pages/todo_list.dart';
import '../entity/todo/todo_item_request.dart';

class TodoCreate extends StatefulWidget {
  const TodoCreate({super.key});

  @override
  State<TodoCreate> createState() {
    return _TodoCreateState();
  }
}

class _TodoCreateState extends State<TodoCreate> {
  final TextEditingController _titleController = TextEditingController(); // 新しいコントローラを追加

  void _registerTodo() {
    final String title = _titleController.text;
    if (title.isNotEmpty) {
      final TodoItemRequestData todoItemRequestData = TodoItemRequestData(title: title);
      TodoRequest().postTodoData(todoItemRequestData).then((_) {
        _titleController.clear();
        // Todoの登録が成功したらTodoList画面に遷移する
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const TodoList()));
      }).catchError((error) {
        print('エラー: $error');
      });
    } else {
      print('タイトルを入力してください');
    }
  }

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
              TextField(
                controller: _titleController, // コントローラを指定
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
                child: const Text('登録'),
                onPressed: _registerTodo,
              )
            ],
          ),
        ),
      ),
    );
  }
}
