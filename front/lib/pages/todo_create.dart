import 'package:flutter/material.dart';
import 'package:front/repository/todo_request.dart';
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
                onPressed: () {
                  // 登録ボタンが押されたときの処理
                  final String title = _titleController.text;
                  if (title.isNotEmpty) {
                    // TodoItemRequestオブジェクトを作成
                    final TodoItemRequestData todoItemRequestData = TodoItemRequestData(title: title);
                    print(todoItemRequestData);
                    // TodoRequestクラスのpostTodoDataメソッドを呼び出してデータをPOST
                    TodoRequest().postTodoData(todoItemRequestData).then((_) {
                      _titleController.clear();
                    }).catchError((error) {
                      print('エラー: $error');
                    });
                  } else {
                    print('タイトルを入力してください');
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
