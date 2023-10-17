import 'dart:convert';
import 'package:http/http.dart' as http;
import '../entity/todo/todo_item_request.dart';

class TodoRequest{
  Uri url = Uri.parse('http://127.0.0.1:8080/tasks');

  Future<TodoDataListRequest> getTodo() async {
    try {
      final response = await http.get(url);
      if (response.statusCode >= 400) {
        print("データの取得失敗");
      } else {
        final responseJsonUtf16 = utf8.decode(response.bodyBytes);
        final Map<String, dynamic> responseJson = json.decode(responseJsonUtf16);
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
}