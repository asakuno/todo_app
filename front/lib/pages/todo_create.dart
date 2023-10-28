import 'package:flutter/material.dart';
import 'package:front/repository/todo_request.dart';
import 'package:front/pages/todo_list.dart';
import '../entity/todo/todo_item_request.dart';
import 'package:front/utility/toast.dart';

class TodoCreate extends StatefulWidget {
  const TodoCreate({super.key});

  @override
  State<TodoCreate> createState() {
    return _TodoCreateState();
  }
}

class _TodoCreateState extends State<TodoCreate> {
  final TextEditingController _titleController =
      TextEditingController(); // 新しいコントローラを追加
  final UtilityToast toast = UtilityToast();

  void _registerTodo() {
    final String title = _titleController.text;
    if (title.isNotEmpty) {
      final TodoItemRequestData todoItemRequestData =
          TodoItemRequestData(title: title);
      TodoRequest().postTodoData(todoItemRequestData).then((_) {
        _titleController.clear();
        // Todoの登録が成功したらTodoList画面に遷移する
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const TodoList()));
      }).catchError((error) {
        print('エラー: $error');
      });
    } else {
      toast.showErrorToast('タイトルを入力してください');
    }
  }

  @override
  Widget build(context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(title: const Text('create todo')),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.infinity, // これは幅が親要素と同じになるように指定しています
              child: TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'タイトルを入力してください',
                ),
                autofocus: true,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: _registerTodo,
              child: const Text('登録'),
            )
          ],
        ),
      ),
    );
  }
}
