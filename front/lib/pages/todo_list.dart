import 'package:flutter/material.dart';
import 'package:front/entity/todo/todo_item_request.dart';
import 'package:front/repository/todo_request.dart';
import 'package:front/pages/todo_create.dart';
import 'package:front/utility/alert_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() {
    return _TodoListState();
  }
}

class _TodoListState extends State<TodoList> {
  late Future<List<TodoItemRequest>> _todoListFuture;
  late TodoRequest _todoRequest;
  var currentPage = 'todo_list_view';

  @override
  void initState() {
    super.initState();
    _todoRequest = TodoRequest();
    _todoListFuture = _fetchTodoList(); // 修正: _fetchTodoListメソッドを呼び出す
  }

  void _navigateToTodoCreate(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TodoCreate()),
    );
  }

  Future<void> _refreshTodoList() async {
    setState(() {
      _todoListFuture = _fetchTodoList();
    });
  }

  Future<List<TodoItemRequest>> _fetchTodoList() async {
    try {
      final todoDataListRequest = await _todoRequest.getTodo();
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
    return Center(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        actions: [
          ElevatedButton(
            onPressed: () {
              _navigateToTodoCreate(context);
            },
            child: const Text('create'),
          ),
        ],
      ),
      body: FutureBuilder<List<TodoItemRequest>>(
        // FutureBuilderは非同期操作が完了するまで待機
        future: _todoListFuture,
        builder: (BuildContext context,
            AsyncSnapshot<List<TodoItemRequest>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator()); // データが読み込まれるまでローディングを表示
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text('${todoList[index].id.toString()}:'),
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
                                Text(todoList[index].done ? '実行済み' : '実行前'),
                                Checkbox(
                                  value: todoList[index].done,
                                  onChanged: (bool? value) async {
                                    await _todoRequest.updateTodoData(
                                        todoList[index].id, value ?? true);
                                    _refreshTodoList();
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: SvgPicture.asset(
                          'assets/icons/pen.svg',
                          width: 30,
                          height: 30,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: SvgPicture.asset(
                          'assets/icons/garbage.svg',
                          width: 30,
                          height: 30,
                        ),
                        onPressed: () {
                          showDialog<void>(
                              context: context,
                              builder: (context) => AlertDialogDelete(
                                    todoRequest: _todoRequest,
                                    todoId: todoList[index].id,
                                    onDeleted: _refreshTodoList,
                                  ));
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    ));
  }
}
