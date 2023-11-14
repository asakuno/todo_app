import 'dart:convert';
import 'package:http/http.dart' as http;
import '../entity/todo/todo_item_request.dart';
import 'package:front/utility/toast.dart';

class TodoRequest {
  Uri url = Uri.parse('http://127.0.0.1:8080/tasks');
  final UtilityToast _toast = UtilityToast();

  Future<TodoDataListRequest> getTodo() async {
    try {
      final response = await http.get(url);
      if (response.statusCode >= 400) {
        print("データの取得失敗");
      } else {
        final responseJsonUtf16 = utf8.decode(response.bodyBytes);
        final Map<String, dynamic> responseJson =
            json.decode(responseJsonUtf16);
        final todoDataListRequest = TodoDataListRequest.fromJson(responseJson);
        return todoDataListRequest;
      }
      // 非同期処理が完了した後に戻り値を返す
      throw Exception('非同期処理が完了した後にreturnが呼ばれなかった');
    } catch (e) {
      // エラー時の処理
      rethrow;
    }
  }

  Future<void> postTodoData(body) async {
    final bodyJsonUtf8 = json.encode(body);
    print(bodyJsonUtf8);
    print("@@@@@@@@@@@@");

    try {
      final response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: bodyJsonUtf8);

      if (response.statusCode >= 400) {
        _toast.showErrorToast("Todoを作成できませんでした");
        //print('Todoを新規登録できませんでした');
      } else {
        _toast.showSuccessToast('Todoを作成しました');
        //print('Todoを新規登録しました');
      }
    } on Exception {
      rethrow;
    }
  }

  Future<void> updateTodoData(int todoId, bool doneValue) async {
    print(todoId);
    try {
      final response = await http.put(
        Uri.parse('http://127.0.0.1:8080/tasks/$todoId'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'done': doneValue}),
      );

      if (response.statusCode >= 400) {
        _toast.showErrorToast("Todoを更新できませんでした");
      } else {
        _toast.showSuccessToast('Todoを更新しました');
      }
    } on Exception {
      rethrow;
    }
  }

  Future<void> deleteTodoData(todoId) async {
    print(todoId);
    try {
      final response = await http.delete(
        Uri.parse('http://127.0.0.1:8080/tasks/$todoId'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode >= 400) {
        _toast.showErrorToast("Todoを削除できませんでした");
      } else {
        _toast.showSuccessToast('Todoを削除しました');
      }
    } on Exception {
      rethrow;
    }
  }
}
