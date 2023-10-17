import 'package:flutter/material.dart';
import 'package:front/entity/todo/todo_item_request.dart';
import 'package:front/repository/todo_request.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() {
    return _TodoListState();
  }
}

class _TodoListState extends State<TodoList> {
  late Future<List<TodoItemRequest>> _todoListFuture;

  @override
  void initState() {
    super.initState();
    _todoListFuture = _fetchTodoList(); // 修正: _fetchTodoListメソッドを呼び出す
  }

  Future<List<TodoItemRequest>> _fetchTodoList() async {
    try {
      final todoDataListRequest = await TodoRequest().getTodo();
      // TodoDataListRequestからTodoItemRequestのリストを抽出
      List<TodoItemRequest> todoList = todoDataListRequest.data;
      return todoList;
    } catch (e) {
      // エラー時の処理
      print('データの読み込みに失敗しました: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<TodoItemRequest>>(
        // FutureBuilderは非同期操作が完了するまで待ちます
        future: _todoListFuture,
        builder: (BuildContext context, AsyncSnapshot<List<TodoItemRequest>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator()); // データが読み込まれるまでローディングを表示
          } else if (snapshot.hasError) {
            return Center(child: Text('データの読み込みに失敗しました: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('データが見つかりませんでした'));
          } else {
            // データが取得されたらリストを表示
            List<TodoItemRequest> todoList = snapshot.data!;
            return ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  shadowColor: Colors.black,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text('${todoList[index].id.toString()}:'),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Text('タイトル:'),
                          Text(todoList[index].title),
                        ],
                      ),
                      Row(
                        children: [
                          const Text('状態:'),
                          Text(todoList[index].done ? '実行済み' : '実行前'),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
